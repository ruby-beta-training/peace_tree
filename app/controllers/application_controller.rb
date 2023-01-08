class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  before_action :set_my_variable
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      admin_root_path
    elsif has_employee_info?(resource)
      new_employee_path
    else
      root_path
    end
  end

  def not_authorized
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end

  def redijectto_employee
    redirect_to new_employee_path, notice: 'You must input infor' if has_employee_info?(@my_variable)
  end

  def has_employee_info?(resource1)
    Employee.where(user_id: resource1.id).blank?
  end

   def set_my_variable
       @my_variable = current_user if user_signed_in?
   end

end
