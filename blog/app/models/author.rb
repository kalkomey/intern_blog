class Author < ApplicationRecord
	has_many :posts
	def name
		firstname + " " + lastname
	end
end
