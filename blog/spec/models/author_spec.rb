require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'create' do
    it 'should create a new author' do
      author = Author.new(
        full_name: 'Matt Boldt',
        dob: '1993-08-14',
      )

      expect { author.save }.to change { Author.count }.by(1)
      expect("#{author.first_name} #{author.last_name}").to eq(author.full_name)
    end

    it 'should fail to create an author without a dob' do
      author = Author.new(full_name: 'Matt Boldt')

      expect(author).to be_invalid
    end
  end
end
