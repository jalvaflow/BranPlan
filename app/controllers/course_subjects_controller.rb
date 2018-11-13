class CourseSubjectsController < ApplicationController
  before_action :set_course_subject, only: [:show, :edit, :update, :destroy]

  # GET /course_subjects
  # GET /course_subjects.json
  def index
    @course_subjects = CourseSubject.all
  end

  # GET /course_subjects/1
  # GET /course_subjects/1.json
  def show
  end

  # GET /course_subjects/new
  def new
    @course_subject = CourseSubject.new
  end

  # GET /course_subjects/1/edit
  def edit
  end

  # POST /course_subjects
  # POST /course_subjects.json
  def create
    @course_subject = CourseSubject.new(course_subject_params)

    respond_to do |format|
      if @course_subject.save
        format.html { redirect_to @course_subject, notice: 'Course subject was successfully created.' }
        format.json { render :show, status: :created, location: @course_subject }
      else
        format.html { render :new }
        format.json { render json: @course_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_subjects/1
  # PATCH/PUT /course_subjects/1.json
  def update
    respond_to do |format|
      if @course_subject.update(course_subject_params)
        format.html { redirect_to @course_subject, notice: 'Course subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_subject }
      else
        format.html { render :edit }
        format.json { render json: @course_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_subjects/1
  # DELETE /course_subjects/1.json
  def destroy
    @course_subject.destroy
    respond_to do |format|
      format.html { redirect_to course_subjects_url, notice: 'Course subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_subject
      @course_subject = CourseSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_subject_params
      params.require(:course_subject).permit(:course_code, :subject_id, :segment_id)
    end
end
