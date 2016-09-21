class UserProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def new
    @user_profile = current_user.build_user_profile
  end

  def create
    @user_profile = current_user.build_user_profile(profile_params)
    if @user_profile.save
      redirect_to user_profile_path(@user_profile)
    else
      render :new
    end
  end

  def show
    @user = current_user
    @user_profile = UserProfile.find(params[:id])
  end

private
  def profile_params
    params.require(:user_profile).permit(:age, :name)
  end
end
