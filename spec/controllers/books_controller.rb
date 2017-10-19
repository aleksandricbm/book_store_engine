require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  categories = FactoryGirl.create(:category)

  describe 'GET #index response' do
    before { get :index }

    it '#index' do
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end

    it 'category not be nil' do
      expect(assigns(:category)).not_to be_nil
      expect(assigns(:count_book_in_category)).not_to be_nil
    end
  end

  it 'category params check' do
    get :index, params: { category: 1 }
    expect(assigns(:category)).not_to be_nil
    expect(assigns(:count_book_in_category)).not_to be_nil
  end

  describe 'GET #show' do
    before { get :show, params: { id: 1 } }

    it '#index response' do
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end

    it 'show book info' do
      expect(assigns(:book)).not_to be_nil
    end
  end
end
