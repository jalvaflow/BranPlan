json.extract! course, :id, :course_id, :comment, :term, :code, :continuity_id, :name, :description, :credits, :independent_study, :created_at, :updated_at
json.url course_url(course, format: :json)
