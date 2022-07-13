# frozen_string_literal: true

json.array! @bids, partial: 'bids/bid', as: :bid
