class SearchesController < ApplicationController
  
  def index
    @results = GroceryBoy.new(params[:query]).search
    binding.irb
  end

  def print
  end

end
