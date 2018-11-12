json.extract! subject, :id, :subject_id, :comment, :term, :name, :abbreviation, :created_at, :updated_at
json.url subject_url(subject, format: :json)
