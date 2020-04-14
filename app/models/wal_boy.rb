require "watir"

class WalBoy

  def initialize(query)

    @query = query

  end

  def search
        browser = Watir::Browser.new :chrome, headless: true


    browser.goto 'walmart.com'

    browser.text_field(id: "global-search-input").value = @query

    browser.button(id: "global-search-submit").click

    browser.wait_until {|b| b.element(id: "searchProductResult").exists? }

    items = []

    browser.elements(class: "search-result-gridview-item-wrapper").each do |product|


    title = product.element(class: "search-result-product-title").text

#    amount = product.span(class: /price-main/).text


    products = {store: "Walmart", name: title,
                #price: amount
    }


    items.push(products)

    end

    browser.close

    items[0..10]

 end 
end


