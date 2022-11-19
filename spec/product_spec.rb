require 'rails_helper'

RSpec.describe Product, type: :model do
  #Initial happy check
  describe 'Validations' do
    it "needs to pass validation with the presence of all required attributes" do
      @category = Category.new(name: "Happy category")
      @product = Product.new(
        name: "T-shirt",
        category: @category,
        quantity: 25,
        price: 1500
      )
      @product.save!
      expect(@product).to be_valid
    end

    #name
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
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end
    #price
    it "needs to fail validation with the absence of price" do
      @category = Category.new(name: "Hoodies")
      @product = Product.new(
        name: "Hoody",
        category: @category,
        quantity: 10
        #no price
      )
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end
    #quantity
    it "needs to validate the presence of quantity" do

    end
    # it "needs to validate the presence of category" do

    # end
    # it "needs to show an error in 'full_messages' array" do

    # end

  end
end
