class Subject < ApplicationRecord
    has_many :course_subjects
    has_many :courses, through: :course_subjects
end
