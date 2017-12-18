require 'rails_helper'

RSpec.describe 'tags/edit', type: :view do
  before(:each) { @tag = assign(:tag, Tag.create!(name: 'MyString')) }

  it 'renders the edit tag form' do
    render

    assert_select 'form[action=?][method=?]', tag_path(@tag), 'post' do
      assert_select 'input#tag_name[name=?]', 'tag[name]'
    end
  end
end