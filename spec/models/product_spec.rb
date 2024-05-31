require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    let(:user) { User.create!(fname: 'Frank', lname: 'Test', email: 'giotest@gmail.com', password: '1233456') }
    let(:product) do
      Product.create!(name: 'Testing', description: 'This is a testing description', assistants: 5, owner_id: user.id)
    end
    # let(:category) { Category.find_or_create_by(name: 'Default') }

    it 'creates product succesfully' do
      user = User.create(fname: 'Frank', lname: 'Test', email: 'giotest@gmail.com', password: '1233456')
      product = Product.create(name: 'sports', description: 'hello world', assistants: 5, owner_id: user.id)
      expect(product).to be_valid
    end

    it 'Product not valid, missing user' do
      product = Product.create(name: 'sports', description: 'hello world', assistants: 5, owner_id: nil)
      expect(product).to_not be_valid
    end

    it 'Product not valid, missing name' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'Product not valid, missing description' do
      product.description = nil
      expect(product).to_not be_valid
    end

    it 'Product not valid, missing category' do
      product.category = nil
      expect(product).to_not be_valid
    end

    it 'When product is created, category is equal to Default' do
      expect(product.category.name).to eq('Default')
      expect(product.category).to_not be_nil
    end
  end

  context 'comments in product validation' do
    let(:user) { User.create!(fname: 'Frank', lname: 'Test', email: 'giotest@gmail.com', password: '1233456') }
    let(:product) do
      Product.create!(name: 'Testing', description: 'This is a testing description', assistants: 5, owner_id: user.id)
    end

    let(:comment) do
      Comment.create!(text: 'This is a test comment in product', author_id: user.id, product_id: product.id)
    end

    before do
      Comment.create!(text: 'This is a test comment in product', author_id: user.id, product_id: product.id)

      Comment.create!(text: 'This is a test comment in product', author_id: user.id, product_id: product.id)

      Comment.create!(text: 'This is a test comment in product', author_id: user.id, product_id: product.id)
    end

    it 'Product has a comment' do
      expect(comment).to be_valid
    end

    it 'Product has a comment count of 3' do
      expect(product.comments.count).to eq(3)
    end
  end
end
