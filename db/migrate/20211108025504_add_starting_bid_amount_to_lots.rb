# frozen_string_literal: true

class AddStartingBidAmountToLots < ActiveRecord::Migration[6.1]
  def change
    add_column :lots, :starting_bid_amount, :decimal
  end
end
