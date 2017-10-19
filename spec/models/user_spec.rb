require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_one :billing_address }
  it { is_expected.to have_one :shipping_address }
  it { is_expected.to have_many :orders }
  it { is_expected.to have_many :reviews }

  it { is_expected.to allow_values('text@example.com', 'MixedABC@mix.ua', 'abc-def@test.gov').for(:email) }
  it { is_expected.not_to allow_values('%^$@ss.rbb', '!#^&*@%^.tt', '$D&F*V)567@eedd.trre').for(:email) }

  it { is_expected.to allow_values('ajf67892dN', '45(J8ffds', '-123eF2sf').for(:password) }
  it { is_expected.not_to allow_values('1234', '#$@ff eee', '634)(&^%$#@!').for(:password) }

  it 'admin method' do
    user = User.create
    expect(user.admin?).to be_in([true, false])
  end

  let(:user) { FactoryGirl.create(:user) }

  it 'requires a password' do
    expect(user.password).to match /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)\S{8,}\z/
  end

  context 'when is an account admin' do
    subject(:ability) { Ability.new(user) }
    let(:user) { FactoryGirl.create(:user, role: 'admin') }
    it { should be_able_to(:admin, user.role) }
  end
  context 'when is an account guest' do
    subject(:ability) { Ability.new(user) }
    let(:user) { FactoryGirl.create(:user) }
    it { expect(user.role).to be_nil }
  end

  context 'validations' do
    it 'requires an email' do
      expect(user).to validate_presence_of(:email)
    end

    it 'requires a unique email (case insensitive)' do
      user.email = 'TEST@DOMEN.COM'
      expect(user).to_not validate_uniqueness_of(:email)
    end

    it 'requires the email to look like an email' do
      user.email = 'test'
      expect(user).to_not be_valid
    end
  end
end
