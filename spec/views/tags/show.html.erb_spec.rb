require 'rails_helper'

RSpec.describe 'tags/show', type: :view do
  before(:each) { @tag = assign(:tag, Tag.create!(name: 'Name')) }

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
