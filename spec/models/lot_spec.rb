# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lot, type: :model do
  describe 'Validations:' do
    describe 'starting bid amount should' do
      it 'not be less than zero.' do
        expect { create(:lot, starting_bid_amount: -2.00) }.to raise_error(ActiveRecord::RecordInvalid,
                                                                           'Validation failed: Starting bid amount The starting bid amount must be greater than 0.')
      end
    end

    describe 'minimum bid increments should' do
      it 'not be less than zero.', :aggregate_failures do
        expect { create(:lot, :minimum_bid_increment_schedule => { 0 => -2.00 }) }.to raise_error(ActiveRecord::RecordInvalid,
          'Validation failed: Minimum bid increment schedule Minimum bid increments must be greater than 0.')
        expect { create(:lot, :minimum_bid_increment_schedule => { 0 => 0.00 }) }.to raise_error(ActiveRecord::RecordInvalid,
          'Validation failed: Minimum bid increment schedule Minimum bid increments must be greater than 0.')
      end
    end
  end
end
