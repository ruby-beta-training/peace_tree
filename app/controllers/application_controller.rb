class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      admin_root_path
    elsif employee?(resource)
      new_employee_path
    else
      root_path
    end
  end

  def not_authorized
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end

  def redirect_to_employee
    redirect_to new_employee_path, notice: 'You must input infor' if employee?(current_user)
  end

  def employee?(resource1)
    Employee.where(user_id: resource1.id).blank?
  end
end
