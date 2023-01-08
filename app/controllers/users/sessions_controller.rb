# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :check_employe_before_login?
  # before_action :check_for_token, only: :create

  # GET /resource/sign_in
  # def new

  # end

  # # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    # if user.present? && user.has_role?(:admin)
    @employee = Employee.find_by(user_id: user.id)
    respond_to do |format|
      if @employee.blank?
        @employee = Employee.new
        @employee.user_id = user.id
        format.html { redirect_to new_employee_path, notice: 'employee infor.' }
      else
        redirect_to root_path
      end
    end

  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # private

  # def check_employe_before_login?
  #   has_employee_info? root_path: new_employee_path
  # end
  # def check_for_token
  #   Employee.where(user_id: params[:user_id]).present?
  #   byebug
  # end


end
