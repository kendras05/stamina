class SearchesController < ApplicationController
  
  def index
    @results = GroceryBoy.new(params[:query]).search
  end

  def print
  end

end