require 'rails_helper'

RSpec.feature 'Catalog page', type: :feature do
  describe 'index' do
    before do
      @cat = FactoryGirl.create(:category)
      @book = FactoryGirl.create(:book)
      visit catalog_path
    end

    it 'show sort list' do
      expect(page.html).to have_content I18n.t('filters.newest_first')
      expect(page.html).to have_content I18n.t('filters.pop_first')
      expect(page.html).to have_content I18n.t('filters.price_l')
      expect(page.html).to have_content I18n.t('filters.price_h')
    end

    it 'isset book in list' do
      expect(page.html).to have_content @book.name
      expect(page.html).to have_content @book.price
    end

    it 'button view more' do
      expect(page.html).to have_css '.thumb-hover-link'
      page.find(:css, 'a[href="' + book_path(@book.id) + '"]').click
      expect(page.find('h1')).to have_content @book.name
      expect(current_url).to have_content book_path(@book.id)
    end

    it 'category list' do
      Category.all.each do |cat|
        expect(page.html).to have_content cat.name
      end
    end
  end
end
