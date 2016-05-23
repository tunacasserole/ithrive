class DashboardController < ApplicationController
  layout 'application'
  def index
  end

  def show
    @users = User.all.name_sort
    @profiles = Profile.all
    @notification = User.current.notifications.broadcast.unread.first
  end


end
