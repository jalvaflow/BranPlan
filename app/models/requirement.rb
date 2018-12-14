class Requirement < ApplicationRecord
    has_many :courses, through: :course_requirements
end
