require 'rails_helper'

RSpec.describe "Products", type: :request do

  let(:user) { User.create!(fname: 'Frank', lname: 'Test', email: 'giotest@gmail.com', password: '1233456') }
  before do
    sign_in user
    Product.create(name: 'Testing', description: 'This is a testing description', assistants: 5, owner_id: user.id)
  end

  it 'GET /index' do
    get root_path
    expect(response).to have_http_status(:success)
  end

  it 'GET users/:user_id/myproducts' do
    get my_products_user_path(user)
    expect(response).to have_http_status(:success)
  end
end
