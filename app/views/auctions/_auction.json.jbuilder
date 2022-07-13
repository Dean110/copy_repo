# frozen_string_literal: true

json.extract! auction, :id, :name, :created_at, :updated_at
json.url auction_url(auction, format: :json)
