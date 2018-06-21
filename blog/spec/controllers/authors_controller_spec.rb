require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe 'GET show' do
    it 'assigns @author' do
      author = Author.create(full_name: 'Matt Boldt', dob: '1993-08-14')
      get :show, params: { id: author.id }

      expect(assigns(:author)).to eq(author)
    end
  end

  describe 'GET new' do
    it 'builds a new author' do
      get :new

      expect(assigns(:author)).not_to be_nil
    end
  end
end
