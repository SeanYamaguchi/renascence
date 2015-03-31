json.array!(@posts_documents) do |posts_document|
  json.extract! posts_document, :id, :text
  json.url posts_document_url(posts_document, format: :json)
end
