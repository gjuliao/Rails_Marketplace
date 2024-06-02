require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'testing event creation' do
    let(:user) { User.create!(fname: 'mike', lname: 'Yoki', email: 'test@gmail.com', password: '123456') }
    let(:product) do
      Product.create!(name: 'Test product', description: 'this is test description', owner_id: user.id, assistants: 5)
    end
    let(:event) do
      Event.create!(
        start_date: Date.today,
        end_date: Date.today + 1,
        start_time: Time.current,
        end_time: Time.current + 5,
        product_id: product.id,
        user_id: user.id
      )
    end

      it 'Check if event is valid' do
        event = Event.create!(
          start_date: Date.today,
          end_date: Date.today + 1,
          start_time: Time.current,
          end_time: Time.current + 5,
          product_id: product.id,
          user_id: user.id
        )
        expect(event).to be_valid
      end

  end
end
