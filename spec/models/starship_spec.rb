require 'rails_helper'

RSpec.describe Starship, type: :model do
  context 'validation tests' do
    it 'ensure name presence' do
      starship = Starship.new(description: 'une petite description', price_per_day: 12).save
      expect(starship).to eq(false)
    end

    it 'ensure description presence' do
      starship = Starship.new(name: 'faucon millenium', price_per_day: 12).save
      expect(starship).to eq(false)
    end

    it 'ensure price per day presence' do
      starship = Starship.new(name: 'faucon millenium', description: 'une petite description').save
      expect(starship).to eq(false)
    end

    it 'ensure price per day is a number' do
      starship = Starship.new(name: 'faucon millenium', description: 'une petite description', price_per_day: 'bonjour').save
      expect(starship).to eq(false)
    end

    it 'should save successfully' do
      starship = Starship.new(description: 'une petite description', name: 'faucon millenium', price_per_day: 12.5).save
      expect(starship).to eq(true)
    end
  end
end
