# frozen_string_literal: true

json.array! @auctions, partial: 'auctions/auction', as: :auction
