json.extract! instructor, :id, :instructor_id, :comment, :email, :first, :middle, :last, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
