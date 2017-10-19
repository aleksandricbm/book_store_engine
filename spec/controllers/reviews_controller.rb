require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  book = FactoryGirl.create(:book)
  FactoryGirl.create(:user)

  it 'create Review' do
    post :create, params: { review: { book_id: book.id, comment: FFaker::Book.description } }
    expect(assigns(:review)).not_to be_nil
  end
end
