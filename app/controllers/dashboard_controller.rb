class DashboardController < ApplicationController
  layout 'application'
  def index
  end

  def show
    @users = User.all.reverse_order
  end


end
