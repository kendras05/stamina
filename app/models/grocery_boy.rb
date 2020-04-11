

require "watir"

class GroceryBoy

  def initialize(query)

    @query = query

  end

  def search

    browser = Watir::Browser.new :chrome, headless: true

    browser.goto 'albertsons.com'

    browser.text_field(id: "skip-main-content").value = @query

    browser.button(aria_label: "search").click
    sleep 1
    search_grid = browser.element(tag_name: "search-grid")

    product_results = []

    search_grid.elements(tag_name: "product-item").each do |product|


      
      product_name = product.h3.text
      product_price = product.element(class: "product-price-con").text
      product = {store:"Albertsons", name: product_name, price: product_price}
      product_results.push(product)
      

    end
    
    browser.close

    # return the final results as an array of hashes

    product_results
  end

end



