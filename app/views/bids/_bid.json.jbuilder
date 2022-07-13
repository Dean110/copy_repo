# frozen_string_literal: true

json.extract! bid, :id, :amount, :created_at, :updated_at
json.url bid_url(bid, format: :json)
