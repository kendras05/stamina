
class GroceryBoy

  def initialize(query)
    @query = query
  end

  def browser_args
    if Rails.env.production?
      %w[--headless --no-sandbox --disable-dev-shm-usage --disable-gpu --remote-debugging-port=9222]
    else
      []
    end
  end

  def search
    #albertsons
    browser = Watir::Browser.new :chrome, args: browser_args

    browser.goto 'albertsons.com'


    browser.text_field(id: "skip-main-content").value = @query

    browser.button(aria_label: "search").click
    sleep 1
    search_grid = browser.element(tag_name: "search-grid")
 
    sleep 3

    product_results = []

    search_grid.elements(tag_name: "product-item").each do |product|

      product_name = product.h3.text
      product_price = product.span(class: /product-price/).text
      product_pic = product.image(class: /ab-lazy/).src
      product = {store:"Albertsons", pic: product_pic ,  name: product_name, price: product_price}
      product_results.push(product)

    end
    sleep 2

    browser.close
    
    product_results[0..10]
  end
end
