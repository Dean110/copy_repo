# frozen_string_literal: true

class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
