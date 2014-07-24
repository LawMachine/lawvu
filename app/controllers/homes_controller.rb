class HomesController < ApplicationController
  def index
    @matters = current_user.roleable.matters
  end
end
