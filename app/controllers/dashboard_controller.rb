class DashboardController < ApplicationController
  layout 'application'
  def index
  end

  def show
    @users = User.all.reverse_order
    @profiles = Profile.all.name_sort
    @notification = User.current.notifications.broadcast.unread.first
  end


end
