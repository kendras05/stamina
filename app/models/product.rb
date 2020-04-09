class Product < ApplicationRecord

  def search
  
    require "watir"

    browser = Watir::Browser.new :chrome, headless: false

    browser.goto 'albertsons.com'

    #browser.button(id:"openFulfillmentModalButton").click

    #zip = browser.text_field(aria_labelledby: "zipcode")
    #zip.value = "89115"

    #this does not work yet
    #s = browser.span(class: /__search-wrapper__icon__/)

    #s.last.click

    #sleep 1

    #browser.button(visible_text: "Select").first.click


    sleep 3


    browser.text_field(id:"skip-main-content").value = "Milk"

    b = browser.button(aria_label:"search")

    b.exists?

    b.click

    sleep 10

    list = browser.elements(tag_name: "product-item").each do |product|



  end

    puts list

    browser.close
    end

end 

