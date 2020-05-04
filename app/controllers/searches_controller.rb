class SearchesController < ApplicationController
  
  def index
    @results = GroceryBoy.new(params[:query]).search
   @vonresults = VonsGirl.new(params[:query]).search 
    #@walresults = [] #WalBoy.new(params[:query]).search
  end

  def print
  end

end
