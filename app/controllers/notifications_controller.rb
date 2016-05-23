class NotificationsController < ApplicationController
  # before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @user = User.current
    @user.mark_all_as_read
    respond_to do |format|
      format.html { redirect_to edit_user_path(User.current, anchor: "tab-notifications") }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @notification=Notification.find params[:id]
    respond_to do |format|

      if @notification.mark_as_read
        format.html { redirect_to dashboard_path(1), notice: 'marked as read' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /profiles/new
  def new
  end

  def create
    @notification = Notification.new(notification_params)
    respond_to do |format|
      if @notification.save
        format.html { redirect_to dashboard_path(1), notice: @notification.errors }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /profiles/1/edit
  def edit
    @notification=Notification.find params[:id]

  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @notification=Notification.find params[:id]
    respond_to do |format|
      if @notification.mark_as_read
        format.html { redirect_to dashboard_path(1), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @notification = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:id, :kind, :state, :content, :user_id, :thriver_id, :bulk, :bulk_ops)
    end
  end
