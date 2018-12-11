class Section < ApplicationRecord
    has_many :instructors, through: :section_instructors
end
