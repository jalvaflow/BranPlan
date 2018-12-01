class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @sections = Section.where(course: @course.course_id)
    @term = Term.find_by(term_id: @course.term)
    @professors = {}
    @days = {}
    @times = {}
    @sections.each do |section|
      instructor_id = SectionInstructor.find_by(section_id: section.section_id).instructor_id
      instructor = Instructor.find_by(instructor_id: instructor_id)
      @professors[section.section] = instructor.first+" "+instructor.last
      days_list = SectionTime.find_by(section_id: section.section_id).days
      @days[section.section] = days_list_convert(days_list)
      start_time = SectionTime.find_by(section_id: section.section_id).start
      end_time = SectionTime.find_by(section_id: section.section_id).end
      @times[section.section] = [convert_time(start_time), convert_time(end_time)]
    end
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

  def convert_time(time)
    t = Time.now.midnight
    t = t + (time*60)
    t = t.strftime("%I:%M %p")
    if t[0] == "0"
      t[0] = ''
    end
    t
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_id, :comment, :term, :code, :continuity_id, :name, :description, :credits, :independent_study)
    end
end
