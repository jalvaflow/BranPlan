class SectionInstructorsController < ApplicationController
  before_action :set_section_instructor, only: [:show, :edit, :update, :destroy]

  # GET /section_instructors
  # GET /section_instructors.json
  def index
    @section_instructors = SectionInstructor.all
  end

  # GET /section_instructors/1
  # GET /section_instructors/1.json
  def show
  end

  # GET /section_instructors/new
  def new
    @section_instructor = SectionInstructor.new
  end

  # GET /section_instructors/1/edit
  def edit
  end

  # POST /section_instructors
  # POST /section_instructors.json
  def create
    @section_instructor = SectionInstructor.new(section_instructor_params)

    respond_to do |format|
      if @section_instructor.save
        format.html { redirect_to @section_instructor, notice: 'Section instructor was successfully created.' }
        format.json { render :show, status: :created, location: @section_instructor }
      else
        format.html { render :new }
        format.json { render json: @section_instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /section_instructors/1
  # PATCH/PUT /section_instructors/1.json
  def update
    respond_to do |format|
      if @section_instructor.update(section_instructor_params)
        format.html { redirect_to @section_instructor, notice: 'Section instructor was successfully updated.' }
        format.json { render :show, status: :ok, location: @section_instructor }
      else
        format.html { render :edit }
        format.json { render json: @section_instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_instructors/1
  # DELETE /section_instructors/1.json
  def destroy
    @section_instructor.destroy
    respond_to do |format|
      format.html { redirect_to section_instructors_url, notice: 'Section instructor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section_instructor
      @section_instructor = SectionInstructor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_instructor_params
      params.require(:section_instructor).permit(:section_id, :instructor_id)
    end
end
