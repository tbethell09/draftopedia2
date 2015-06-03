json.array!(@pins) do |pin|
  json.extract! pin, :id, :team, :article
  json.url pin_url(pin, format: :json)
end
