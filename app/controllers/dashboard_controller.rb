class DashboardController < ApplicationController
  layout 'application'
  def dashboard
    puts current_user.name
  end

end
