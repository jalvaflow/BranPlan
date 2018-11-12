json.extract! course_subject, :id, :course_code, :subject_id, :segment_id, :created_at, :updated_at
json.url course_subject_url(course_subject, format: :json)
