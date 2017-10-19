require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  scenario 'Visit Home page' do
    visit root_path
    expect(page.find('h2')).to have_content I18n.t('title.welcome')
  end

  describe 'login and sign_up for email' do
    before { visit root_path }

    it 'login' do
      user = FactoryGirl.create(:user)
      first(:link, I18n.t('devise.sessions.new.log_in'), minimum: 1).click
      expect(page.html).to have_content I18n.t('devise.sessions.new.log_in')
      within('form#new_user') do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button I18n.t('devise.sessions.new.log_in')
      end
      expect(page.html).to have_content user.email
      expect(page.html).to have_content I18n.t('header.log_out')
      expect(page.find('h2')).to have_content I18n.t('title.welcome')
    end

    it 'sign_up email' do
      first(:link, I18n.t('devise.registrations.new.sign_up'), minimum: 1).click
      expect(page.find('h3')).to have_content I18n.t('devise.registrations.new.sign_up')
      within('form#new_user') do
        fill_in 'user_email', with: 'example@exampler.com'
        fill_in 'user_password', with: '12QAZ)5ybd'
        fill_in 'user_password_confirmation', with: '12QAZ)5ybd'
        click_button I18n.t('devise.registrations.new.sign_up')
      end
      expect(page.find('h2')).to have_content I18n.t('title.welcome')
    end
  end

  describe 'click links' do
    before do
      @cat = FactoryGirl.create(:category)
      FactoryGirl.create(:book)
      visit root_path
    end

    it 'home' do
      first(:link, I18n.t('footer.home'), minimum: 1).click
      expect(page.find('h2')).to have_content I18n.t('title.welcome')
    end

    it 'shop category' do
      first(:link, @cat.name, minimum: 1).click
      expect(page.html).to have_content I18n.t('title.catalog')
      expect(page.html).to have_content I18n.t('button.view_more')
    end
  end
end
