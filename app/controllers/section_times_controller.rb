class SectionTimesController < ApplicationController
  before_action :set_section_time, only: [:show, :edit, :update, :destroy]

  # GET /section_times
  # GET /section_times.json
  def index
    @section_times = SectionTime.all
  end

  # GET /section_times/1
  # GET /section_times/1.json
  def show
  end

  # GET /section_times/new
  def new
    @section_time = SectionTime.new
  end

  # GET /section_times/1/edit
  def edit
  end

  # POST /section_times
  # POST /section_times.json
  def create
    @section_time = SectionTime.new(section_time_params)

    respond_to do |format|
      if @section_time.save
        format.html { redirect_to @section_time, notice: 'Section time was successfully created.' }
        format.json { render :show, status: :created, location: @section_time }
      else
        format.html { render :new }
        format.json { render json: @section_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /section_times/1
  # PATCH/PUT /section_times/1.json
  def update
    respond_to do |format|
      if @section_time.update(section_time_params)
        format.html { redirect_to @section_time, notice: 'Section time was successfully updated.' }
        format.json { render :show, status: :ok, location: @section_time }
      else
        format.html { render :edit }
        format.json { render json: @section_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_times/1
  # DELETE /section_times/1.json
  def destroy
    @section_time.destroy
    respond_to do |format|
      format.html { redirect_to section_times_url, notice: 'Section time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section_time
      @section_time = SectionTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_time_params
      params.require(:section_time).permit(:section_id, :start, :end, :days, :type, :building, :room)
    end
end
