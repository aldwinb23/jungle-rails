require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @product = Product.new(:name => 'Whatever', :price_cents => 30, :quantity => 5, :category_id => 2)
    @productfail = Product.new

    @product.save
    @productfail.save
  end

  describe 'Validations' do
    it "validates name is present" do
      expect(@product.name).to be_present
    end

    it "validates price is present" do
      expect(@product.price_cents).to be_present
    end
  
    it "validates quantity is present" do
      expect(@product.quantity).to be_present
    end
  
    it "validates category is present" do
      expect(@product.category_id).to be_present
    end

    it "validates when one value is not present" do
      expect(@productfail.name).to be_nil
      expect(@productfail.errors.full_messages).to include("Name can't be blank")
      expect(@productfail.price_cents).to be_nil
      expect(@productfail.errors.full_messages).to include("Price can't be blank")
      expect(@productfail.quantity).to be_nil
      expect(@productfail.errors.full_messages).to include("Quantity can't be blank")
      expect(@productfail.category_id).to be_nil
      expect(@productfail.errors.full_messages).to include("Category can't be blank")
    end

  end
end
