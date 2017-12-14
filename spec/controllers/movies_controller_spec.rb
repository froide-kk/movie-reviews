require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:valid_attributes) { { name: 'Title', rating: 5 } }
  let(:invalid_attributes) { { name: 'Title', rating: 5.5 } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Movie.create(valid_attributes)
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      movie = Movie.create!(valid_attributes)
      get :show, params: { id: movie.to_param }, session: valid_session
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
      movie = Movie.create!(valid_attributes)
      get :edit, params: { id: movie.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Movie' do
        expect {
          post :create, params: { movie: valid_attributes }, session: valid_session
        }.to change(Movie, :count).by(1)
      end

      it 'redirects to the created movie' do
        post :create, params: { movie: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Movie.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response' do
        post :create, params: { movie: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated title', rating: 5 } }

      it 'updates the requested movie' do
        movie = Movie.create!(valid_attributes)
        put :update, params: { id: movie.to_param, movie: new_attributes }, session: valid_session
        movie.reload
        expect(movie.name).to eq('Updated title')
      end

      it 'redirects to the movie' do
        movie = Movie.create!(valid_attributes)
        put :update, params: { id: movie.to_param, movie: valid_attributes }, session: valid_session
        expect(response).to redirect_to(movie)
      end
    end

    context 'with invalid params' do
      it 'returns a success response' do
        movie = Movie.create!(valid_attributes)
        put :update, params: { id: movie.to_param, movie: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested movie' do
      movie = Movie.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: movie.to_param }, session: valid_session
      }.to change(Movie, :count).by(-1)
    end

    it 'redirects to the movies list' do
      movie = Movie.create!(valid_attributes)
      delete :destroy, params: { id: movie.to_param }, session: valid_session
      expect(response).to redirect_to(movies_url)
    end
  end
end
