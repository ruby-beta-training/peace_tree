class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      admin_root_path
    elsif resource.employee.blank?
      new_employee_path
    else
      root_path
    end
  end

  def not_authorized
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end

  def redirect_to_employee
    redirect_to new_employee_path, notice: 'You must input infor' if current_user.employee.blank?
  end
end
