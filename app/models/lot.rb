# frozen_string_literal: true

class Lot < ApplicationRecord
  has_many :bids

  # The opening bid is special: the 'house' always places the opening bid.
  validates :starting_bid_amount, numericality: {
    greater_than_or_equal_to: 0,
    message: 'The starting bid amount must be greater than 0.'
  }

  serialize :minimum_bid_increment_schedule
  
  validate :increment_schedule_validation

  def bid_increment
    minimum_bid_increment_schedule[0]
  end

  def current_high_bid
    return starting_bid_amount if bids.empty?
    bids.map { |bid| bid.amount }.sort.first
  end

  def increment_schedule_validation
    minimum_bid_increment_schedule.each_value do |increment|
      errors.add(:minimum_bid_increment_schedule, 'Minimum bid increments must be greater than 0.') if increment <= 0
    end
  end
end
