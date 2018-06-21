require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @author = Author.create(full_name: 'Matt Boldt', dob: '1993-08-14')
    @post = Post.create(title: 'New post', body: 'New post', author: @author)
  end

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET new' do
    it 'builds a new post' do
      get :new

      expect(response).to render_template('new')
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe 'GET show' do
    it 'renders show template' do
      get :show, params: { id: @post.id }

      expect(assigns(:post)).to eq(@post)
      expect(response).to render_template('show')
    end
  end

  describe 'POST create' do
    it 'creates a new post' do
      params = { post: { title: 'New Post', body: 'New post body', author_id: @author.id } }
      post :create, params: params
      expect(response).to redirect_to(post_path(assigns[:post]))
    end
  end

  describe 'GET edit' do
    it 'renders edit for an existing author' do
      get :edit, params: { id: @post.id }

      expect(response).to render_template('edit')
      expect(assigns(:post)).to eq(@post)
    end
  end

  describe 'POST update' do
    it 'updates an existing post' do
      params = { id: @post.id, post: { title: 'New Title' } }
      put :update, params: params
      expect(response).to redirect_to(post_path(assigns[:post]))
    end
  end
end
