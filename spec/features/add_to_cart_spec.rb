require 'rails_helper'

# visit the home page
# find (first) product box 
# click blue add button
# check nav to see if cart quantity updated
# click on cart navigation
# check if product is in cart
# check if the price matches (for the prodect added)
# check if item (name) is in the cart

RSpec.feature "PurchaseProducts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  # scenario "A logged in user purchases a product" do
  # end

  scenario "A anonymous user purchases a product" do
    visit '/'
    #find the 1st product and click "Add"
    first('article.product').find_button('Add').click()
    #Find and click on cart with 1 item
    find_link('My Cart (1)').click()
    #Ensure page loads
    expect(find('header.page-header')).to have_content('My Cart')
    expect(page).to have_content('TOTAL:')
    expect(page).to have_content('64.99')
    
  end

end