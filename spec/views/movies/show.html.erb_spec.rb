require 'rails_helper'

RSpec.describe 'movies/show', type: :view do
  before(:each) do
    @movie = assign(:movie, create(:movie))
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match(/#{@movie.name}/)
    expect(rendered).to match(/#{@movie.rating}/)
  end
end
