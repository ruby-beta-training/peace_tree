# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # before_action :has_employee_info?

  # GET /resource/sign_up
  # def new
  # end

  # def create
  #   byebug
  #   @user = User.create(users_params)
  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to root_path, notice: 'Add friend successfully.' }
  #     end
  #   end
  # end

  # private

  # def users_params
  #   params.require(:user).permit(:email, :password)
  # end
  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  protected

  def after_sign_up_path_for(resource)
    new_employee_path
  end

  # def has_employee_info?(resource)
  #   Employee.where(user_id: resource.id).present?
  # end

end
