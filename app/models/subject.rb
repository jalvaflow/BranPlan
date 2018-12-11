class Subject < ApplicationRecord
    has_many :subjects, through: :course_subjects
end
