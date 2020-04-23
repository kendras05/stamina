require 'watir'

class VonsGirl

  def initialize(query)
    @query = query
  end
=begin
  def browser_args
    if Rails.env.production?
      %w[--headless --no-sandbox --disable-dev-shm-usage --disable-gpu --remote-debugging-port=9222]
    else
      []
    end
  end
=end
  def search
    #vons
    browser = Watir::Browser.new :chrome # args: browser_args

    browser.goto 'vons.com'

    sleep 1
    browser.text_field(id: "skip-main-content").value = @query

    browser.button(aria_label: "search").click
    sleep 1
    search_grid = browser.element(tag_name: "search-grid")
 
    sleep 3

    von_results = []

#    logo = browser.image(class: /logo-vons/).src
    search_grid.elements(tag_name: "product-item").each do |product|
      
      von_name = product.h3.text
      von_price = product.element(class: "product-price-con").text
      von_pic = product.image(class: /ab-lazy/).src
      von_product = {store:"Vons",
#                 logoview: logo, 
                 pic: von_pic, name: von_name, price: von_price}
      von_results.push(von_product)

    end
    sleep 2

    browser.close
    
    von_results[0..4]
  end
end

