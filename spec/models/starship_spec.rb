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
  context 'measure the average rating of a starship' do
    it 'should return the calculated value of an average rating of any starship' do
      user = User.create(first_name: 'toto', last_name: 'toto', email: 'toto1236@gmail.com', password: '123456')
      starship = Starship.create(description: 'une petite description', name: 'faucon millenium', price_per_day: 12.5,
                                 loaner: user)
      rental1 = Rental.create(start_date: '2021-12-20', end_date: '2021-12-22', starship:, renter: user, price: 12_000)
      rental2 = Rental.create(start_date: '2021-12-23', end_date: '2021-12-24', starship:, renter: user, price: 12_000)
      rental3 = Rental.create(start_date: '2021-12-26', end_date: '2021-12-28', starship:, renter: user, price: 12_000)
      Review.create(content: 'test', rating: 2, rental: rental1)
      Review.create(content: 'test', rating: 5, rental: rental2)
      Review.create(content: 'test', rating: 3, rental: rental3)
      expect(starship.average_rate).to eq(3.3)
    end

    it 'should return a value to the closest decimal' do
      user = User.create(first_name: 'toto', last_name: 'toto', email: 'toto1236@gmail.com', password: '123456')
      starship = Starship.create(description: 'une petite description', name: 'faucon millenium', price_per_day: 12.5,
                                 loaner: user)
      rental1 = Rental.create(start_date: '2021-12-20', end_date: '2021-12-22', starship:, renter: user, price: 12_000)
      rental2 = Rental.create(start_date: '2021-12-23', end_date: '2021-12-24', starship:, renter: user, price: 12_000)
      rental3 = Rental.create(start_date: '2021-12-26', end_date: '2021-12-28', starship:, renter: user, price: 12_000)
      Review.create(content: 'test', rating: 3, rental: rental1)
      Review.create(content: 'test', rating: 5, rental: rental2)
      Review.create(content: 'test', rating: 3, rental: rental3)
      expect(starship.average_rate).to eq(3.7)
    end
  end
end
