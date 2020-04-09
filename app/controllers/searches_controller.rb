class SearchesController < ApplicationController
  
  def index
    @results = Product.search
  end

  def print
  end

end
