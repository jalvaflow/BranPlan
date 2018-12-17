class EnrollmentsController < ApplicationController

  def enroll
    @user = current_user
    @course_id = params[:course_id]
    @section_id = params[:section_id]
    @term_id = params[:term_id]
    user_enrollements = Enrollment.where(user_id: @user.id, term_id: @term_id)
    enrollment = Enrollment.find_by(user_id: @user.id, course_id: @course_id, term_id: @term_id) unless Enrollment.find_by(user_id: @user.id, course_id: @course_id, term_id: @term_id) == nil
    # check if user is already enrolled in this course
    if (enrollment != nil)
      flash[:danger] = "Already enrolled in #{Course.find(@course_id).code}."
      redirect_back(fallback_location: root_path)
      return
    elsif (user_enrollements.length == 6)
      flash[:danger] = "You've reach the maximum number of enrolled courses for this term (6). Unenroll to add more."
      redirect_back(fallback_location: root_path)
      return
    end
    # if not, enroll in this course
    Enrollment.create(user_id: @user.id, course_id: @course_id, section_id: @section_id, term_id: @term_id)
    # Add event to Event model
    course = Course.find_by(id: @course_id)
    section_time = SectionTime.where(section_id: params[:section_id_str])
    if !section_time.nil?
      if course.term == "1183"
        section_time.each do |section_t|
          days_list = days_list_convert(section_t.days)
          start_minutes = section_t.start
          end_minutes = section_t.end
          createCourseEventsFall2018(course, days_list, start_minutes, end_minutes)
        end
      elsif course.term == "1191"
        section_time.each do |section_t|
          days_list = days_list_convert(section_t.days)
          start_minutes = section_t.start
          end_minutes = section_t.end
          createCourseEventsSpring2019(course, days_list, start_minutes, end_minutes)
        end
      end
    end

    flash[:success] = "Succesful enrollment in #{Course.find(@course_id).code}!"
    redirect_back(fallback_location: root_path)
  end

  def createCourseEventsFall2018(course, days_list, start_time, end_time)
    date = DateTime.new(2018, 8, 29)
    104.times do |day_num|
      if days_list.include? date.strftime("%A")
        start_date = convert_time_24(start_time, date)
        end_date = convert_time_24(end_time, date)
        Event.create(title: course.code, description: course.description, code: course.code, start: start_date, end: end_date, user_id: current_user.id)
      end
      date = date + 1.day
    end
  end

  def createCourseEventsSpring2019(course, days_list, start_time, end_time)
    date = DateTime.new(2019, 1, 15)
    107.times do |day_num|
      if days_list.include? date.strftime("%A")
        start_date = convert_time_24(start_time, date)
        end_date = convert_time_24(end_time, date)
        Event.create(title: course.code, description: course.description, code: course.code, start: start_date, end: end_date)
      end
      date = date + 1.day
    end
  end

  def unenroll
    # Destroys record in Enrollments table with matching u_id, c_id, and t_id.
    @user = current_user
    @course_id = params[:course_id]
    @term_id = params[:term_id]
    enrollment = Enrollment.find_by(user_id: @user.id, course_id: @course_id, term_id: @term_id) unless Enrollment.find_by(user_id: current_user.id, course_id: @course_id, term_id: @term_id) == nil
    if !enrollment.nil?
      enrollment.destroy
    end
    course = Course.find_by(id: @course_id)
    course_events = Event.where(title: course.code, code: course.code, user_id: current_user.id)
    if !course_events.nil?
      course_events.each do |event|
        event.destroy
      end
    end
    flash[:danger] = "Unenrolled from #{Course.find(@course_id).code}!"
    redirect_back(fallback_location: root_path)
  end

  def convert_time_24(time, date)
    date = date.midnight
    date = date+(time*60).seconds
    date
  end

  def days_list_convert(days_list)
    days = Array.new(5)
    days_list.each do |day|
      if day == "m"
        days[0] = "Monday"
      elsif day == "tu"
        days[1] = "Tuesday"
      elsif day == "w"
        days[2] = "Wednesday"
      elsif day == "th"
        days[3] = "Thursday"
      else
        days[4] = "Friday"
      end
    end
    days.reject! { |d| d.nil? }
    days = days.join(", ")
  end

end
