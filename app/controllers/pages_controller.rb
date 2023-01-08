class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :redijectto_employee
  def home; end
end
