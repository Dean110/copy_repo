# frozen_string_literal: true

class CreateAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :auctions do |t|
      t.string :name

      t.timestamps
    end
  end
end
