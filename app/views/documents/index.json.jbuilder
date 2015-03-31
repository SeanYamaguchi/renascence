json.array!(@documents) do |document|
  json.extract! document, :id, :text, :video, :picture, :post_id
  json.url document_url(document, format: :json)
end
