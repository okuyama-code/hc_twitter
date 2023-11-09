class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update

  end
end
