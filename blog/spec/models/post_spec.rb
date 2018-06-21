require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'create' do
    it 'should create a new author' do
      author = Author.create(full_name: 'Matt Boldt', dob: '1993-08-14')
      post = Post.new(
        title: 'Post title',
        body: 'This is the body',
        author: author,
      )

      expect { post.save }.to change { Post.count }.by(1)
    end

    it 'should fail to create post with a long title and no author' do
      post = Post.new(
        title: 'This title is much longer than 100 characters. Holy crap look at all these characters',
        body: 'This is the body',
      )

      expect(post).to be_invalid
    end
  end
end
