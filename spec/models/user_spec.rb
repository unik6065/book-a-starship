require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations tests' do
    it 'should verify the presence of first_name' do
      user = User.new(last_name: 'toto', email: 'toto@test.com', password: '123456').save
      expect(user).to eq(false)
    end
    it 'should verify the presence of last_name' do
      user = User.new(first_name: 'toto', email: 'toto@test.com', password: '123456').save
      expect(user).to eq(false)
    end
    it 'should verify the presence of email' do
      user = User.new(first_name: 'toto', last_name: 'toto', password: '123456').save
      expect(user).to eq(false)
    end
    it 'should verify the presence of password' do
      user = User.new(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com').save
      expect(user).to eq(false)
    end
    it 'should not allows two people to have the same email' do
      User.new(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com', password: '123456').save
      user2 = User.new(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com', password: '123456').save
      expect(user2).to eq(false)
    end
    it 'should save successfully' do
      user = User.new(first_name: 'toto', last_name: 'toto', email: 'toto@gmail.com', password: '123456').save
      expect(user).to eq(true)
    end
  end
end
