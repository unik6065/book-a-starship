require 'rails_helper'

RSpec.describe Starship, type: :model do
  context 'validation tests' do
    it 'ensure name presence' do
      starship = Starship.new(description: 'une petite description', price_per_day: 12)
      expect(starship).to_not be_valid
    end

    it 'ensure description presence' do
      starship = Starship.new(name: 'faucon millenium', price_per_day: 12)
      expect(starship).to_not be_valid
    end

    it 'ensure price per day presence' do
      starship = Starship.new(name: 'faucon millenium', description: 'une petite description')
      expect(starship).to_not be_valid
    end

    it 'ensure price per day is a number' do
      starship = Starship.new(name: 'faucon millenium', description: 'une petite description',
                              price_per_day: 'bonjour')
      expect(starship).to_not be_valid
    end

    it 'should save successfully' do
      user = User.create(first_name: 'toto', last_name: 'test', email: 'test@gmail.com', password: 123)
      starship = Starship.new(description: 'une petite description', name: 'faucon millenium', price_per_day: 12.5,
                              loaner: user)
      expect(starship).to be_valid
    end
  end
end
