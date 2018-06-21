class Author < ApplicationRecord

  has_many :posts

  validates :full_name, :dob, presence: true

  def full_name=(name)
    names = name.split(' ')
    self.first_name = names.first
    self.last_name = names.last unless names.length == 1
    full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
