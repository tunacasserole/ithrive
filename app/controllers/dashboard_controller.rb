class DashboardController < ApplicationController
  layout 'application'
  def index
  end

  def show
    puts current_user.name
    # @quotes = Quote.find_by_user_id current_user.id
    @quotes = Quote.all.reverse_order
  end


end
