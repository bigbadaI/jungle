require 'rails_helper'


RSpec.feature "Visitor navigates details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  'Test',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details for 1st product" do
    # ACT
    visit root_path

    # Ensure page loads
    expect(page).to have_css 'article.product', count: 10
    #Click on 1st products details
    page.first('a.btn.btn-default.pull-right').click()
    #Ensure details page has loaded
    expect(find('header.page-header')).to have_content('Test')
    
  end

end