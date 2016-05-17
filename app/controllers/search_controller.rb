class SearchController < ApplicationController
  def execute
    puts params
    @quotes = Quote.first
    respond_to do |format|
      format.html
      format.json { render json: @quotes }
    end
  end # def execute
end
