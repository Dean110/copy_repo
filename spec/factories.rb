# frozen_string_literal: true

FactoryBot.define do
  factory :lot do
    starting_bid_amount { 0 }
    minimum_bid_increment_schedule { { 0 => 1 } }
  end

  factory :bid do
    amount { 10.0 }
    lot
  end
end
