require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    let(:user) { User.create!(fname: 'Frank', lname: 'Test', email: 'giotest@gmail.com', password: '1233456') }
    let(:product) do
      Product.create!(name: 'Testing', description: 'This is a testing description', assistants: 5, owner_id: user.id)
    end

    it 'creates product succesfully' do
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

    it 'Like is created successfully' do
      like = Like.create(user_id: user.id, product_id: product.id)
      expect(like).to be_valid
    end

    it 'Like count is equal to 3' do
      like = Like.create(user_id: user.id, product_id: product.id)
      like1 = Like.create(user_id: user.id, product_id: product.id)
      like2 = Like.create(user_id: user.id, product_id: product.id)

      product.reload
      
      expect(product.likes_counter).to eq 3
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

      it 'Product comments are displayed in order from descending order' do
        expect(product.comments.count).to eq(3)
      end
  end

  context 'Descending comment order in product' do
    let(:user) { User.create!(fname: 'Frank', lname: 'Test', email: 'giotest@gmail.com', password: '1233456') }
    let(:product) do
      Product.create!(name: 'Testing', description: 'This is a testing description', assistants: 5, owner_id: user.id)
    end

    let!(:comment1) { Comment.create!(text: 'First comment', author_id: user.id, product_id: product.id, created_at: 1.day.ago) }
    let!(:comment2) { Comment.create!(text: 'Second comment', author_id: user.id, product_id: product.id, created_at: 2.days.ago) }
    let!(:comment3) { Comment.create!(text: 'Third comment', author_id: user.id, product_id: product.id, created_at: 3.days.ago) }

    it 'Testing order of creation ascending' do
      recent_comments = product.older_comments
      expect(recent_comments).to eq([comment3, comment2, comment1])
    end

    it 'Testing order of creation descending' do
      older_comments = product.recent_comments
      expect(older_comments).to eq([comment1, comment2, comment3])
    end
  end
end
