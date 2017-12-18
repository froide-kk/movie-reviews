require 'rails_helper'

RSpec.describe 'tags/index', type: :view do
  before(:each) { assign(:tags, [Tag.create!(name: 'Name')]) }

  it 'renders a list of tags' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 1
  end
end
