require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @category = Category.create(name: "Shoes")
      @product = @category.products.create(
        name: "sandals",
        description: "nice for the summer",
        price_cents: 500,
        quantity: 1
        )
      expect(@product).to be_valid
    end
    it "is not valid without a name" do
      @category = Category.create(name: "Shoes")
      @product = @category.products.create(
        name: nil,
        description: "nice for the summer",
        price_cents: 500,
        quantity: 1
        )
      expect(@product).to_not be_valid
    end
    it "is not valid without a price" do
      @category = Category.create(name: "Shoes")
      @product = @category.products.create(
        name: "sandals",
        description: "nice for the summer",
        price_cents: nil,
        quantity: 1
        )
      expect(@product).to_not be_valid
    end
    it "is not valid without a quantity" do
      @category = Category.create(name: "Shoes")
      @product = @category.products.create(
        name: "sandals",
        description: "nice for the summer",
        price_cents: 500,
        quantity: nil
        )
      expect(@product).to_not be_valid
    end
    it "is not valid without a category" do
      @product = Product.create(
        name: "sandals",
        description: "nice for the summer",
        price_cents: 500,
        quantity: 1
        )
      expect(@product).to_not be_valid
    end
  end
end
