class Course < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :requirements, through: :course_requirements
  has_many :subjects, through: :course_subjects
end
