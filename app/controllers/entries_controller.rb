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

    @graph = [
      {name: "work", data: @user.entries.reduce({}) { |result, entry| result.merge({entry.date => entry.work}) }},
      {name: "social", data: @user.entries.reduce({}) { |result, entry| result.merge({entry.date => entry.social}) }},
      {name: "health", data: @user.entries.reduce({}) { |result, entry| result.merge({entry.date => entry.health}) }},
      {name: "education", data: @user.entries.reduce({}) { |result, entry| result.merge({entry.date => entry.education}) }}
    ]


      @entries = {}
      @user.entries.each { |e| @entries[e.date.to_s] = e.work.to_i}
      @entries = @entries.to_json


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
