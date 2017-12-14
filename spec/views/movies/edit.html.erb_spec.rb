require 'rails_helper'

RSpec.describe 'movies/edit', type: :view do
  before(:each) { @movie = assign(:movie, create(:movie)) }

  it 'renders the edit movie form' do
    render

    assert_select 'form[action=?][method=?]', movie_path(@movie), 'post' do
      assert_select 'input#movie_name[name=?]', 'movie[name]'
      assert_select 'input#movie_rating[name=?]', 'movie[rating]'
    end
  end
end
