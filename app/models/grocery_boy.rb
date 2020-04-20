class GroceryBoy

  def initialize(query)

    @query = query

  end

  def search

   browser = Watir::Browser.new :chrome, args: %w[--headless --no-sandbox --disable-dev-shm-usage --disable-gpu --remote-debugging-port=9222] 
    #albertsons

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
   
    # return the final results as an array of hashes 
    #albertsons                                      
=begin
    #walmart

    browser.goto 'walmart.com' 
    
    browser.text_field(id: "global-search-input").value = @query
    
    browser.button(id: "global-search-submit").click
    
    browser.wait_until {|b| b.element(id: "searchProductResult").exists? }

    items = []

    browser.elements(class: "search-result-gridview-item-wrapper").each do |product|

    sleep 30

    title = product.element(class: "search-result-product-title").text
  
#    amount = product.span(class: /price-main/).text
   

    products = {store: "Walmart", name: title, 
                #price: amount
    }
 

    items.push(products)

    end

=end

    browser.close

    product_results[0..10]                           
#    items[0..10]
end
end
