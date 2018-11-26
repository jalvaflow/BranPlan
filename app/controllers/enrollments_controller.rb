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
    flash[:success] = "Succesful enrollment in #{Course.find(@course_id).code}!"
    redirect_back(fallback_location: root_path)
  end

  def unenroll
    # Destroys record in Enrollments table with matching u_id, c_id, and t_id.
    @user = current_user
    @course_id = params[:course_id]
    @term_id = params[:term_id]
    enrollment = Enrollment.find_by(user_id: @user.id, course_id: @course_id, term_id: @term_id) unless Enrollment.find_by(user_id: current_user.id, course_id: @course_id, term_id: @term_id) == nil
    enrollment.destroy
    flash[:danger] = "Unenrolled from #{Course.find(@course_id).code}!"
    redirect_back(fallback_location: root_path)
  end

end
