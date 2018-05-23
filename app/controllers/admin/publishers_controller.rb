class Admin::PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin
  # GET /publishers
  # GET /publishers.json
  def index
    @publishers = Publisher.all
  end

  # GET /publishers/1
  # GET /publishers/1.json
  def show
  end

  # GET /publishers/new
  def new
    @publisher = Publisher.new
  end

  # GET /publishers/1/edit
  def edit
  end

  # POST /publishers
  # POST /publishers.json
  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to admin_publisher_path(@publisher), notice: 'Publisher was successfully created.' }
        format.json { render :show, status: :created, location: admin_publisher_path(@publisher) }
      else
        format.html { render :new }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishers/1
  # PATCH/PUT /publishers/1.json
  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to admin_publisher_path(@publisher), notice: 'Publisher was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_publisher_path(@publisher) }
      else
        format.html { render :edit }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishers/1
  # DELETE /publishers/1.json
  def destroy
    @publisher.destroy
    respond_to do |format|
      format.html { redirect_to admin_publishers_url, notice: 'Publisher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    def verify_admin
      group_admin = Userlevel.find_by(level: "Admin")
      if current_user == nil or current_user.userlevel != group_admin
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
