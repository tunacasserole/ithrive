class DashboardController < ApplicationController
  layout 'application'
  def index
  end

  def show
    @quotes = Quote.all.reverse_order
  end


end
