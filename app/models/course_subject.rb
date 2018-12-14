class CourseSubject < ApplicationRecord
    belongs_to :courses
    belongs_to :subjects
end
