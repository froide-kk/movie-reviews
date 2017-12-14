require 'rails_helper'

RSpec.describe 'movies/index', type: :view do
  before(:each) do
    @movies = assign(:movies, [create(:movie, name: 'Title 1'),
                               create(:movie, name: 'Title 2')])
  end

  it 'renders a list of movies' do
    render

    assert_select 'tr>td', text: @movies[0].name, count: 1
    assert_select 'tr>td', text: @movies[1].name, count: 1
    assert_select 'tr>td', text: @movies[0].rating.to_s, count: 2
  end
end
