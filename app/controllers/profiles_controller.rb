class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile.update(profile_params)

      flash[:notice] = 'プロフィール情報を編集しました。'
      redirect_to profile_path
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :self_introduction, :location, :website, :icon, :header)
  end


end
