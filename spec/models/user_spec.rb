require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'shaher') }
  let(:invalid_user) { User.create(name: '') }
  let(:deals) { User.reflect_on_association(:deals).macro }
  let(:groups) { User.reflect_on_association(:groups).macro }

  it 'checks for the  user validity' do
    @user = User.create(name: 'shaher')
    expect(@user).to be_valid
  end

  it 'user name should not be empty' do
    expect(invalid_user).to_not be_valid
  end

  it 'checks for correct post association' do
    expect(deals).to eq(:has_many)
  end

  it 'check for the correct comment association' do
    expect(groups).to eq(:has_many)
  end
end