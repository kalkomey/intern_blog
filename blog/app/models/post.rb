class Post < ApplicationRecord
  belongs_to :author

  validates :title, :body, :author, presence: true
  validates :title, length: { maximum: 100 }

  def to_param
    [id, title.parameterize].join('-')
  end
end
