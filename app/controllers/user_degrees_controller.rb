class UserDegreesController < ApplicationController
  before_action :set_user_degree, only: [:show, :edit, :update, :destroy]

  # GET /user_degrees
  # GET /user_degrees.json
  def index
    @user_degrees = UserDegree.all
  end

  # GET /user_degrees/1
  # GET /user_degrees/1.json
  def show
  end

  # GET /user_degrees/new
  def new
    @user_degree = UserDegree.new
  end

  # GET /user_degrees/1/edit
  def edit
  end

  # POST /user_degrees
  # POST /user_degrees.json
  def create
    @user_degree = UserDegree.new(user_degree_params)

    respond_to do |format|
      if @user_degree.save
        format.html { redirect_to @user_degree, notice: 'User degree was successfully created.' }
        format.json { render :show, status: :created, location: @user_degree }
      else
        format.html { render :new }
        format.json { render json: @user_degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_degrees/1
  # PATCH/PUT /user_degrees/1.json
  def update
    respond_to do |format|
      if @user_degree.update(user_degree_params)
        format.html { redirect_to @user_degree, notice: 'User degree was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_degree }
      else
        format.html { render :edit }
        format.json { render json: @user_degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_degrees/1
  # DELETE /user_degrees/1.json
  def destroy
    @user_degree.destroy
    respond_to do |format|
      format.html { redirect_to user_degrees_url, notice: 'User degree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_degree
      @user_degree = UserDegree.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_degree_params
      params.require(:user_degree).permit(:user_id, :degree_id)
    end
end
