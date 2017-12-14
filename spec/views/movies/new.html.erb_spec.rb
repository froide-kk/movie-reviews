require 'rails_helper'

RSpec.describe 'movies/new', type: :view do
  before(:each) do
    assign(:movie, Movie.new(name: 'new Title', rating: 5.0))
  end

  it 'renders new movie form' do
    render

    assert_select 'form[action=?][method=?]', movies_path, 'post' do
      assert_select 'input#movie_name[name=?]', 'movie[name]'
      assert_select 'input#movie_rating[name=?]', 'movie[rating]'
    end
  end
end
