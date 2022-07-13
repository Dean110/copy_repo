# frozen_string_literal: true

class AddLotToBids < ActiveRecord::Migration[6.1]
  def change
    add_reference :bids, :lot, index: true
    add_index :bids, :lots
  end
end
