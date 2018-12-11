class Instructor < ApplicationRecord
    has_many :sections, through: :section_instructors
end
