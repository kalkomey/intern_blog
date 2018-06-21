require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:author) do
    Author.create(full_name: 'Matt Boldt', dob: '1993-08-14')
  end

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'renders show template' do
      post = Post.create(
        title: 'New post',
        body: 'New post',
        author: author,
      )
      get :show, params: { id: post.id }
      expect(response).to render_template('show')
    end
  end

  describe 'POST create' do
    it 'creates a new post' do
      params = { post: { title: 'New Post', body: 'New post body', author_id: author.id } }
      post :create, params: params
      expect(response).to redirect_to(post_path(assigns[:post]))
    end
  end
end
