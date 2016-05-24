class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @profiles = Profile.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @health_attributes = HealthAttribute.all
    # @user_health_attributes = User.current.user_health_attributes
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/login
  def login
    sign_in(User.current) unless User.current
    redirect_to 'devise/sessions#new'
  end

  # GET /users/1/edit
  def edit
    @user = User.current
    # @health_attributes = HealthAttribute.all
    # @user_health_attributes = @user.user_health_attributes
    # @user.notifications.unread.update_all(:state => 'read')
  end

  # POST /users
  # POST /users.json
  def admin_create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_agency_path(@user.agency), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to dashboard_path(1), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :name, :role, :agency_id, :foreign_creds, :facebook_user, :twitter_handle, :address_1, :address_2, :city, :state, :postal_code, :phone_number)
    end
end
