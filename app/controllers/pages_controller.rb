class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_employee
  def home; end
end
