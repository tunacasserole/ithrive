class EmailMessagesController < ApplicationController
  # before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @user = User.current
    @user.mark_all_as_read
    respond_to do |format|
      format.html { redirect_to edit_user_path(User.current, anchor: "tab-email-messages") }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @email_message=EmailMessage.find params[:id]
    # respond_to do |format|

    #   if @email_message.mark_as_read
    #     format.html { redirect_to @email_message, notice: 'marked as read' }
    #     format.json { render :show, status: :created, location: @email_message }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @email_message.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  # GET /profiles/new
  def new
    @email_message=EmailMessage.new(sender_id: User.current.id)
  end

  def create
    @email_message = EmailMessage.new(notification_params)
    respond_to do |format|
      if @email_message.save
        format.html { redirect_to dashboard_path(1), notice: @email_message.errors }
        format.json { render :show, status: :created, location: @email_message }
      else
        format.html { render :new }
        format.json { render json: @email_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /profiles/1/edit
  def edit
    @email_message=EmailMessage.find params[:id]

  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @email_message=EmailMessage.find params[:id]
    respond_to do |format|
      if @email_message.mark_as_read
        format.html { redirect_to dashboard_path(1), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_message }
      else
        format.html { render :edit }
        format.json { render json: @email_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @email_message.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @email_message = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      binding.pry
      params.require(:email_message).permit(:id, :type_of, :state, :recipient_id, :thriver_id, :sender_id, :to, :cc, :subject, :body)
    end
  end
