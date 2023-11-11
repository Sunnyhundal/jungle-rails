require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

  it 'should save successfully when all fields are valid' do
    @category = Category.new(name: 'test')
    @product = Product.new(name: 'test', price_cents: 100, quantity: 1, category: @category)
    expect(@product).to be_valid
  end

  it 'should not save when name is nil' do
    @category = Category.new(name: 'test')
    @product = Product.new(name: nil, price_cents: 100, quantity: 1, category: @category)
    @product.valid?
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end

  it 'should not save when price is nil' do
    @category = Category.new(name: 'test')
    @product = Product.new(name: 'test', price_cents: nil, quantity: 1, category: @category)
    @product.valid?
    expect(@product.errors.full_messages).to include("Price is not a number")
  end
  it 'should not save when quantity is nil' do
    @category = Category.new(name: 'test')
    @product = Product.new(name: 'test', price_cents: 100, quantity: nil, category: @category)
    @product.valid?
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end
  it 'should not save when category is nil' do
    @category = Category.new(name: 'test')
    @product = Product.new(name: 'test', price_cents: 100, quantity: 1, category: nil)
    @product.valid?
    expect(@product.errors.full_messages).to include("Category can't be blank" || "Category must exist")
  end

    end
  end
