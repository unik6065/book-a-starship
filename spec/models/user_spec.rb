require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations tests' do
    it 'should verify the presence of first_name' do
      user = User.new(last_name: 'toto', email: 'toto@test.com', password: '123456')
      expect(user).to_not be_valid
    end
    it 'should verify the presence of last_name' do
      user = User.new(first_name: 'toto', email: 'toto@test.com', password: '123456')
      expect(user).to_not be_valid
    end
    it 'should verify the presence of email' do
      user = User.new(first_name: 'toto', last_name: 'toto', password: '123456')
      expect(user).to_not be_valid
    end
    it 'should verify the presence of password' do
      user = User.new(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com')
      expect(user).to_not be_valid
    end
    it 'should not allows two people to have the same email' do
      User.new(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com', password: '123456')
      user2 = User.new(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com', password: '123456')
      expect(user2).to_not be_valid
    end
    it 'should save successfully' do
      user = User.new(first_name: 'toto', last_name: 'toto', email: 'toto3@gmail.com', password: '123456')
      expect(user).to be_valid
    end
  end
  context 'test about the owner state of a user' do
    it 'owner? should return false if a user does not have any starship' do
      user = User.create(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com', password: '123456')
      expect(user.owner?).to eq(false)
    end
    it 'owner? should return true if a user does have a starship' do
      user = User.create(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com', password: '123456')
      Starship.create(name: 'test', description: 'test', price_per_day: 125, loaner: user)
      expect(user.owner?).to eq(true)
    end

    it 'owner_of? should return false if the user is not the owner of this starship' do
      user = User.create(first_name: 'toto', last_name: 'toto', email: 'toto45@gmail.com', password: '123456')
      user2 = User.create(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com', password: '123456')
      starship = Starship.create(name: 'test', description: 'test', price_per_day: 125, loaner: user2)
      expect(user.owner_of?(starship)).to eq(false)
    end

    it 'owner_of? should return true if the user is the owner of this starship' do
      user = User.create(first_name: 'toto', last_name: 'toto', email: 'toto45@gmail.com', password: '123456')
      starship = Starship.create(name: 'test', description: 'test', price_per_day: 125, loaner: user)
      expect(user.owner_of?(starship)).to eq(true)
    end
  end
end
