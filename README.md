rails g scaffold Requirement requirement_id:string comment:string long:string short:string

rails g scaffold Instructor instructor_id:string comment:string email:string first:string middle:string last:string

rails g scaffold Term term_id:string comment:string name:string start:date end:date

rails g scaffold Subject subject_id:string comment:string term:string name:string abbreviation:string

rails g scaffold Segment segment_id:integer subject_id:string name:string

rails g scaffold Course course_id:string comment:string term:string code:string continuity_id:integer name:string description:string credits:float independent_study:boolean 

rails g scaffold CourseRequirement course_id:string requirement:string

rails g scaffold CourseSubject course_code:string subject_id:string segment_id:integer

rails g scaffold Section section_id:string comment:string course:string section:integer details:string status:string status_text:string enrolled:integer limit:integer waiting:integer 

rails g scaffold SectionTime section_id:string start:integer end:integer days:string type:string building:string room:string

rails g scaffold SectionInstructor section_id:string instructor_id:string
