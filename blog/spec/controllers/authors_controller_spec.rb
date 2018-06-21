require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  let(:author) do
    Author.create(full_name: 'Matt Boldt', dob: '1993-08-14')
  end

  describe 'GET show' do
    it 'assigns @author' do
      get :show, params: { id: author.id }

      expect(assigns(:author)).to eq(author)
      expect(response).to render_template('show')
    end
  end

  describe 'GET new' do
    it 'builds a new author' do
      get :new

      expect(response).to render_template('new')
      expect(assigns(:author)).not_to be_nil
    end
  end

  describe 'POST create' do
    it 'creates a new author' do
      params = { author: { full_name: 'Matt Boldt', dob: '1993-08-14' } }
      post :create, params: params
      expect(response).to redirect_to(author_path(assigns[:author]))
    end
  end

  describe 'GET edit' do
    it 'renders edit for an existing author' do
      get :edit, params: { id: author.id }

      expect(response).to render_template('edit')
      expect(assigns(:author)).to eq(author)
    end
  end

  describe 'POST update' do
    it 'updates an existing author' do
      params = { id: author.id, author: { full_name: 'Matt Boldty', dob: '1990-08-14' } }
      put :update, params: params
      expect(response).to redirect_to(author_path(assigns[:author]))
    end
  end
end
