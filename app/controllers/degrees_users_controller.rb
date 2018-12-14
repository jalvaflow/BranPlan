class DegreesUsersController < ApplicationController
  before_action :set_degrees_user, only: [:show, :edit, :update, :destroy]

  # GET /degrees_users
  # GET /degrees_users.json
  def index
    @degrees_users = DegreesUser.all
  end

  # GET /degrees_users/1
  # GET /degrees_users/1.json
  def show
  end

  # GET /degrees_users/new
  def new
    @degrees_user = DegreesUser.new
  end

  # GET /degrees_users/1/edit
  def edit
  end

  # POST /degrees_users
  # POST /degrees_users.json
  def create
    @degrees_user = DegreesUser.new(degrees_user_params)

    respond_to do |format|
      if @degrees_user.save
        format.html { redirect_to @degrees_user, notice: 'Degrees user was successfully created.' }
        format.json { render :show, status: :created, location: @degrees_user }
      else
        format.html { render :new }
        format.json { render json: @degrees_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /degrees_users/1
  # PATCH/PUT /degrees_users/1.json
  def update
    respond_to do |format|
      if @degrees_user.update(degrees_user_params)
        format.html { redirect_to @degrees_user, notice: 'Degrees user was successfully updated.' }
        format.json { render :show, status: :ok, location: @degrees_user }
      else
        format.html { render :edit }
        format.json { render json: @degrees_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /degrees_users/1
  # DELETE /degrees_users/1.json
  def destroy
    @degrees_user.destroy
    respond_to do |format|
      format.html { redirect_to degrees_users_url, notice: 'Degrees user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_degrees_user
      @degrees_user = DegreesUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def degrees_user_params
      params.require(:degrees_user).permit(:user_id, :degree_id)
    end
end
