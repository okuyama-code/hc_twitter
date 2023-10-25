class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def top
    @user = User.find_by(id: current_user.id)
    # console
  end

  def profile
  end
end
