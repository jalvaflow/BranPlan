class UserCourseHistoryController < ApplicationController

    def add_course
      @user = current_user
      @code = params[:course_code]
      # if not, enroll in this course
      UserCourseHistory.create(user_id: @user.id, course_code: @code)
      flash[:success] = "You have successfully added #{@code} to your course history."
      redirect_back(fallback_location: root_path)
    end

    def remove_course
      # Destroys record in Enrollments table with matching u_id, c_id, and t_id.
      @user = current_user
      @code = params[:course_code]
      entry = UserCourseHistory.find_by(user_id: @user.id, course_code: @code) unless UserCourseHistory.find_by(user_id: @user.id, course_code: @code) == nil
      entry.destroy
      flash[:danger] = "Removed #{@code} from your course history."
      redirect_back(fallback_location: root_path)
    end

end
