class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    # @profile = current_user.build_profile(username: params[:username], self_introduction: params[:self_introduction], location: params[:location], website: params[:website], icon: params[:icon], header: params[:header])
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      pp "ifのほう"
      flash[:success] = 'プロフィール情報を編集しました。'
      redirect_to profile_path(@profile)
    else
      pp "elseのほう"
      flash[:alert] = 'まだ保存できていません'
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :self_introduction, :location, :website, :icon, :header)
  end


end
