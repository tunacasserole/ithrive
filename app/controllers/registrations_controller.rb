class RegistrationsController < Devise::RegistrationsController

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :agency_id, :password, :password_confirmation, :current_password, :foreign_creds, :facebook_user, :twitter_handle, :address_1, :address_2, :city, :state, :postal_code, :phone_number)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :agency_id, :password, :password_confirmation, :current_password, :foreign_creds, :facebook_user, :twitter_handle, :address_1, :address_2, :city, :state, :postal_code, :phone_number)
  end
end
