require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'shaher') }
  let(:group) { Group.create(name: 'shaher', user_id: user.id) }

  it 'should be valid with valid attributes' do
    expect(group).to be_valid
  end

  it 'should be not valid without a name' do
    group.name = ''
    expect(group).to_not be_valid
  end

  it 'should be not valid without a user' do
    group.user_id = nil
    expect(group).to_not be_valid
  end

  it 'checks correct association between user and groups' do
    user.groups.should include(group)
  end
end
