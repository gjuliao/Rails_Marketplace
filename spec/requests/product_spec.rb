require 'rails_helper'

RSpec.describe "Products", type: :request do

  let(:user) { User.create!(fname: 'Frank', lname: 'Test', email: 'giotest@gmail.com', password: '1233456') }

  let(:product) do
    Product.create(name: 'Testing', description: 'This is a testing description', assistants: 5, owner_id: user.id)
  end

  before do
    sign_in user
  end

  context 'Get requests for products' do
    it 'GET /index' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  
    it 'GET users/:user_id/myproducts' do
      get my_products_user_path(user)
      expect(response).to have_http_status(:success)
    end
    it 'GET users/:user_id/products/new' do
      get new_user_product_path(user)
      expect(response).to have_http_status(:success)
    end
  
    it 'GET users/:user_id/products/:product_id/edit' do
      get edit_user_product_path(user, product)
      expect(response).to have_http_status(:success)
    end
  end

  context 'Post requests for product' do
    before do
      sign_in user
    end
    
    it 'create method' do
      product = { name: 'testing', description: 'This is a test description to test', assistants: 5, owner_id: user.id }
      post "/users/#{user.id}/products", params: { user:, product: }
      expect(response).to have_http_status(:redirect)
    end

    it 'update method' do
      product = Product.create!(name: 'Testing', description: 'This is a testing description', assistants: 5, owner_id: user.id)
      product_edit = { name: 'testing', description: 'This is a test description to test', assistants: 5, owner_id: user.id }
      patch "/users/#{user.id}/products/#{product.id}", params: { user:, product: product_edit }
      puts response.body
      expect(response).to have_http_status(:redirect)
    end

    it 'destroy method' do
      product = Product.create!(name: 'Testing', description: 'This is a testing description', assistants: 5, owner_id: user.id)
      delete "/users/#{user.id}/products/#{product.id}", params: { user:, product: }
      puts response.body
      expect(response).to have_http_status(:redirect)
    end

  end
end
