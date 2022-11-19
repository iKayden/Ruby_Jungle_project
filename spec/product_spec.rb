require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "needs to pass validation with the presence of name" do
      @category = Category.new(name: "testing category")
      @product = Product.new(
        name: "T-shirt",
        category: @category,
        quantity: 25,
        price: 1500
      )
      @product.save!
      expect(@product).to be_valid
    end

    it "needs to fail validation with the absence of name" do
      @category = Category.new(name: "testing category")
      @product = Product.new(
        name: nil,
        category: @category,
        quantity: 25,
        price: 1500
      )
      @product.save
      expect(@product).not_to be_valid
    end

    # it "needs to validate the presence of price" do

    # end
    # it "needs to validate the presence of quantity" do

    # end
    # it "needs to validate the presence of category" do

    # end
    # it "needs to show an error in 'full_messages' array" do

    # end

  end
end
