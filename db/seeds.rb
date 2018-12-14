# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
######## Join Google group at the beginning of the JSON file so that we can get automatic updates to the table
parsed = JSON.parse(File.read("public/all_data_formatted.JSON"), :quirks_mode => true); 0
requirements = []
instructors = []
terms = []
subjects = []
courses = []
course_reqs = []
course_subjects = []
sections = []
section_times = []
section_instructors = []
segments = []
 parsed.each do |line|
    case line["type"]
    when "requirement"
        requirements << {
            requirement_id: line["id"], #string
            comment: line["comment"], #string
            long: line["long"], #string
            short: line["short"] #string
        }
    when "instructor" ########## Finish up with other attributes
        instructors << {
            instructor_id: line["id"],
            comment: line["comment"],
            email: line["email"], # string (validate email)
            first: line["first"],
            middle: line["middle"],
            last: line["last"]
        }
    when "term"
        terms << {
            term_id: line["id"],
            comment: line["comment"],
            name: line["name"],
            start: line["start"], #date
            end: line["end"] #date
        }
    when "subject" ########## Finish up with other attributes edit for LINE
        subjects << {
            subject_id: line["id"],
            comment: line["comment"],
            term: line["term"], #foreign key?
            name: line["name"],
            abbreviation: line["abbreviation"]
        }
        line["segments"].each do |segment| ####################### figure out with courses
            segments << {
                segment_id: segment["id"], #integer
                subject_id: line["id"], #string
                name: segment["name"] #string
            }
        end
    when "course" ########## Finish up with other attributes
        courses << {
            course_id: line["id"], #string
            comment: line["comment"],
            term: line["term"],
            code: line["code"],
            continuity_id: line["continuity_id"],
            name: line["name"],
            description: line["description"], #string ################Will also contain prereqs in description
            credits: line["credits"], #float
            independent_study: line["independent_study"] #boolean
        }
        line["requirements"].each do |requirement|
            course_reqs << {
                course_id: line["id"],
                requirement: requirement #string
                # requirement_id: requirement #string ################################################################################################################################################################################################################################################
            }
        end
        line["subjects"].each do |subject| ##################figure this shit out with subject segments
            course_subjects << {
                course_code: line["code"],
                subject_id: subject["id"],
                segment_id: subject["segment"]
            }
        end
    when "section"
        sections << {
            section_id: line["id"],
            comment: line["comment"],
            course: line["course"], #foreign
            section: line["section"], #foreign
            details: line["details"], #text
            status: line["status"], #enum string
            status_text: line["status_text"], #user visable rep of status
            enrolled: line["enrolled"], #integer value that is changed by new students enrolling in this course section
            limit: line["limit"], #integer that relates to enrolled
            waiting: line["waiting"] #integer related to enrolled
            # instructors: line["instructors"] ############################# Make sure to put "serialize: instructors" in the sections model
        }
        line["times"].each do |time|
            section_times << {
                section_id: line["id"],
                start: time["start"], #integer in the closed interval [0, 1440]
                end: time["end"], #integer in the closed interval [0, 1440]
                days: time["days"], ############################# Make sure to put "serialize :days, Arrays" in the section_times model
                section_type: time["type"], #should this be a determinining aspect for section times (i.e. should this attribute be an enumeration)
                building: time["building"],
                room: time["room"]
            }
        end
        line["instructors"].each do |instructor|
            section_instructors << {
                section_id: line["id"],
                instructor_id: instructor
            }
        end
    end
end

# Major seeding
parsedDegrees = JSON.parse(File.read("public/major_minor.JSON"), :quirks_mode => true); 0
degrees = []
parsedDegrees.each do |line|
    degrees << {
        name: line["name"],
        degree_type: line["type"],
        cores: line["cores"],
        electives: line["electives"],
        description: line["description"],
        site_link: line["site_link"],
        core_courses: line["core_courses"],
        elective_courses: line["elective_courses"]
    }
end


 # debugger
Requirement.import requirements
Instructor.import instructors
Term.import terms
Subject.import subjects
Course.import courses
CourseRequirement.import course_reqs
CourseSubject.import course_subjects
Section.import sections
SectionTime.import section_times
SectionInstructor.import section_instructors
Segment.import segments
Degree.import degrees
