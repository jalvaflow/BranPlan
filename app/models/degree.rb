class Degree < ApplicationRecord    
    # attr_accessible :name,
    #                :degree_type,
    #                :cores,
    #                :electives,
    #                :description,
    #                :site_link,
    #                :core_courses,
    #                :elective_courses

    serialize :core_courses, Array
    serialize :elective_courses, Array
    has_and_belongs_to_many :users

    # accepts_nested_attributes_for :declarations,
    #     :reject_if => :all_blank,
    #     :allow_destroy => true
    # accepts_nested_attributes_for :users
end
