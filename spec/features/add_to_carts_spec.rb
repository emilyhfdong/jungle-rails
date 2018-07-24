require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
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
  scenario "They can add to cart" do
    # ACT
    visit root_path

    # DEBUG / VERIFY

    page.find('article').find('.btn-primary').click
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end
end
