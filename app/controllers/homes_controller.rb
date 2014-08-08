class HomesController < ApplicationController
  def index
    @active_menu = "dashboard"
    @current_page = "Dashboard"
    @matters = current_user.roleable.matters
  end
end
