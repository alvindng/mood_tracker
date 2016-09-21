class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entry = Entry.new
  end

  def create
    @user = current_user
    @user_profile = @user.user_profile
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      flash[:notice] = 'Entry saved'
      respond_to do |format|
        format.html {redirect_to user_profile_path(@user_profile)}
        format.js
      end
    else
      flash[:notice] = "Entry was not saved because"
      redirect_to user_profile_path(@user_profile)
    end
  end

  def show
    @entry = current_user
    @user_profile = UserProfile.find(params[:id])
  end

private
  def entry_params
    params.require(:entry).permit(:work, :social, :education, :health, :date)
  end
end
