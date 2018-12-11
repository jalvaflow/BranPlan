class CourseRequirement < ApplicationRecord
    belongs_to :requirement 
    belongs_to :course
end
