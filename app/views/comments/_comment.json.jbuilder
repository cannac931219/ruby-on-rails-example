json.extract! comment, :id, :body, :title, :created_at, :updated_at
json.url comment_url(comment, format: :json)
