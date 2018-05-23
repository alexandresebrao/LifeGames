class Admin::UserlevelsController < ApplicationController
  before_action :set_userlevel, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin
  # GET /userlevels
  # GET /userlevels.json
  def index
    @userlevels = Userlevel.all
  end

  # GET /userlevels/1
  # GET /userlevels/1.json
  def show
  end

  # GET /userlevels/new
  def new
    @userlevel = Userlevel.new
  end

  # GET /userlevels/1/edit
  def edit
  end

  # POST /userlevels
  # POST /userlevels.json
  def create
    @userlevel = Userlevel.new(userlevel_params)

    respond_to do |format|
      if @userlevel.save
        format.html { redirect_to @userlevel, notice: 'Userlevel was successfully created.' }
        format.json { render :show, status: :created, location: @userlevel }
      else
        format.html { render :new }
        format.json { render json: @userlevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userlevels/1
  # PATCH/PUT /userlevels/1.json
  def update
    respond_to do |format|
      if @userlevel.update(userlevel_params)
        format.html { redirect_to @userlevel, notice: 'Userlevel was successfully updated.' }
        format.json { render :show, status: :ok, location: @userlevel }
      else
        format.html { render :edit }
        format.json { render json: @userlevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userlevels/1
  # DELETE /userlevels/1.json
  def destroy
    @userlevel.destroy
    respond_to do |format|
      format.html { redirect_to userlevels_url, notice: 'Userlevel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userlevel
      @userlevel = Userlevel.find(params[:id])
    end

    def verify_admin
      group_admin = Userlevel.find_by(level: "Admin")
      if current_user == nil or current_user.userlevel != group_admin
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userlevel_params
      params.require(:userlevel).permit(:level)
    end
end
