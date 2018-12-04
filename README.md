Registrar DB Schema
    Model: Requirement
            -rails g scaffold Requirement requirement_id:string comment:string long:string short:string

    Model: Instructor
            -rails g scaffold Instructor instructor_id:string comment:string email:string first:string middle:string last:string

    Model: Term
            -rails g scaffold Term term_id:string comment:string name:string start:date end:date

    Model: Segment
            -rails g scaffold Segment segment_id:integer subject_id:string name:string

    Model: Course
            -rails g scaffold Course course_id:string comment:string term:string code:string continuity_id:integer name:string description:string credits:float independent_study:boolean

    Model: Subject
            -rails g scaffold Subject subject_id:string comment:string term:string name:string abbreviation:string

    Model: CourseSubject
            -rails g scaffold CourseSubject course_code:string subject_id:string segment_id:integer

    Model: SectionTime
            -rails g scaffold SectionTime section_id:string start:integer end:integer days:string section_type:string building:string room:string

    Model: CourseRequirement
            -rails g scaffold CourseRequirement course_id:string requirement:string

    Model: SectionInstructor
            -rails g scaffold SectionInstructor section_id:string instructor_id:string

    Model: Section
         -rails g scaffold Section section_id:string comment:string course:string section:integer details:string status:string status_text:string enrolled:integer limit:integer waiting:integer
        
