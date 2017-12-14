require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'without name or rating' do
    it { expect(Movie.new.valid?).to be_falsey }
    it { expect(Movie.new(name: 'Title').valid?).to be_falsey }
    it { expect(Movie.new(rating: 0).valid?).to be_falsey }
  end
  context 'with duplicated name' do
    before do
      @title = 'Duplicated title'
      Movie.new(name: @title, rating: 0).save
    end
    it { expect(Movie.new(name: @title, rating: 0).valid?).to be_falsey }
  end
  context 'with out of range(rating)' do
    it 'is not valid' do
      expect(Movie.new(name: 'Less than 0', rating: -1).valid?).to be_falsey
      expect(Movie.new(name: 'Greater than 5', rating: 5.5).valid?).to be_falsey
    end
  end
end
