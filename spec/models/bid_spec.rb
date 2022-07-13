# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe 'Validations:' do
    describe 'amount should' do
      it 'not be less than or equal to zero.', :aggregate_failures do
        expect { create(:bid, amount: -2.00) }.to raise_error(ActiveRecord::RecordInvalid,
                                                              /Validation failed: Amount The bid amount must be greater than 0./)
      end

      describe 'be greater than or equal to the highest bid amount and the appropriate increment amount.' do
        shared_examples 'bid amount is not high enough.' do
          it 'Expects failed validation' do
            expect { create(:bid, amount: amount, lot: lot) }.to raise_error(ActiveRecord::RecordInvalid,
                                                                        /Validation failed: Amount Bid is not high enough./)
          end
        end

        context 'Given a lot with only a starting bid and' do
          let(:lot) { create(:lot, starting_bid_amount: 1) }

          context 'given a bid that is the same as the lot\'s starting bid,' do
            let(:amount) { 1 }
            
            it_should_behave_like 'bid amount is not high enough.'
          end

          context 'given a bid that is less than the lot\'s starting bid,' do
            let(:amount) { 0.50 }
            
            it_should_behave_like 'bid amount is not high enough.'
          end

          context 'given a bid that is less than the lot\'s minimum increment,' do
            let(:amount) { 1.5 }

            it_should_behave_like 'bid amount is not high enough.'
          end
        end

        context 'Given a lot with one bid and' do
          let(:lot) { create(:lot) }

          before do
            create(:bid, lot: lot, amount: 1)
          end

          context 'given a bid that is the same as the lot\'s high bid' do
            let(:amount) { 1 }
            
            it_should_behave_like 'bid amount is not high enough.'
          end

          context 'given a bid that is less than the lot\'s high bid' do
            let(:amount) { 0.50 }
            
            it_should_behave_like 'bid amount is not high enough.'
          end

          context 'given a bid that is less than the lot\'s high bid in addition to the minimum increment' do
            let(:amount) { 1.5 }

            it_should_behave_like 'bid amount is not high enough.'
          end
        end
      end
    end
  end

  describe 'ActiveRecord relations:' do
    subject { create(:bid, lot: lot) }

    let(:lot) { create(:lot) }

    it 'should have a Lot', :aggregate_failures do
      expect(subject).to be_persisted
      expect(lot).to eq(subject.lot)
    end
  end
end
