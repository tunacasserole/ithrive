class RegistrationsController < Devise::RegistrationsController

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(account_update_params)
        format.html { redirect_to @user, notification: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def create
    @user = User.new(sign_up_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notification: 'User was successfully created.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :role, :agency_id, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :role, :agency_id, :password, :password_confirmation, :current_password)
  end

end
