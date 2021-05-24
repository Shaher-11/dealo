=begin
require 'rails_helper'

RSpec.describe Deal, type: :model do
  let(:user) { User.create(name: 'shaher') }
  let(:group) { Group.create(name: 'musicgroup') }
  let(:deal) { Deal.create(title: 'thetitle', amount: 25, author_id: user.id) }

  it 'should be a valid with the valid attributes' do
    expect(deal).to be_valid
  end

  it 'should be not valid without a title' do
    deal.title = ''
    expect(deal).to_not be_valid
  end

  it 'should be not valid without a user' do
    deal.author_id = nil
    expect(deal).to_not be_valid
  end

  it 'should be not valid without a user' do
    deal.amount = nil
    expect(deal).to_not be_valid
  end

  it 'checks the  correct association between user and deal' do
    user.deals.should include(deal)
  end
end
=end 