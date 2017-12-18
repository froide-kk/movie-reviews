require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let(:valid_attributes) { { name: 'Title' } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Tag.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      tag = Tag.create! valid_attributes
      get :show, params: { id: tag.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      tag = Tag.create! valid_attributes
      get :edit, params: { id: tag.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Tag' do
        expect {
          post :create, params: { tag: valid_attributes }, session: valid_session
        }.to change(Tag, :count).by(1)
      end

      it 'redirects to the created tag' do
        post :create, params: { tag: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Tag.last)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated title' } }

      it 'updates the requested tag' do
        tag = Tag.create! valid_attributes
        put :update, params: { id: tag.to_param, tag: new_attributes }, session: valid_session
        tag.reload
        expect(tag.name).to eq('Updated title')
      end

      it 'redirects to the tag' do
        tag = Tag.create! valid_attributes
        put :update, params: { id: tag.to_param, tag: valid_attributes }, session: valid_session
        expect(response).to redirect_to(tag)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested tag' do
      tag = Tag.create! valid_attributes
      expect {
        delete :destroy, params: { id: tag.to_param }, session: valid_session
      }.to change(Tag, :count).by(-1)
    end

    it 'redirects to the tags list' do
      tag = Tag.create! valid_attributes
      delete :destroy, params: { id: tag.to_param }, session: valid_session
      expect(response).to redirect_to(tags_url)
    end
  end
end
