# frozen_string_literal: true

class CreateLots < ActiveRecord::Migration[6.1]
  def change
    create_table :lots do |t|
      t.string :imageUrl
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
