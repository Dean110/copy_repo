# frozen_string_literal: true

class Bid < ApplicationRecord
  belongs_to :lot

  validates :amount, numericality: {
    greater_than: 0,
    message: 'The bid amount must be greater than 0.'
  }

  validate :amount_greater_than_or_equal_to_required_increment

  def amount_greater_than_or_equal_to_required_increment
    errors.add(:amount, 'Bid is not high enough.') if amount < lot.current_high_bid + lot.bid_increment
  end
end
