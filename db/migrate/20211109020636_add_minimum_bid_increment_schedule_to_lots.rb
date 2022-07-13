# frozen_string_literal: true

class AddMinimumBidIncrementScheduleToLots < ActiveRecord::Migration[6.1]
  def change
    add_column :lots, :minimum_bid_increment_schedule, :text
  end
end
