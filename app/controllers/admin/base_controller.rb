class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, :check_admin_access!

  layout 'admin'

  private

  def check_admin_access!
    authorize(:gateway, :admin_namespace?)
  end
end
