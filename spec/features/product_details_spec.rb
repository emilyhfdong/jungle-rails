require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They can click on the header and navigate to the product page" do
    # ACT
    visit root_path

    # DEBUG / VERIFY

    page.find('article').find('header').click
    expect(page).to have_content('Reviews')
    # save_screenshot
  end

  scenario "They can click on the details button to navigate to the product page" do
    visit root_path

    page.find('article').find('.pull-right').click
    expect(page).to have_content('Reviews')
    # save_screenshot
  end
end


