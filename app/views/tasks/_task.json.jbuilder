json.extract! task, :id, :title, :content, :created_at, :updated_at
json.url post_url(task, format: :json)
