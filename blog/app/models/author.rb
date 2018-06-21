class Author < ApplicationRecord

  has_many :posts

  validates :full_name, :dob, presence: true
  validate :born_in_the_past

  def full_name=(name)
    names = name.split(' ')
    self.first_name = names.first
    self.last_name = names.last unless names.length == 1
    full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def born_in_the_past
    errors.add(:dob, 'Must be in the past') unless dob < Date.current
  end
end
