class Author < ApplicationRecord

  has_many :posts

  validates :full_name, :dob, presence: true
  validate :born_in_the_past

  def full_name=(name)
    names = name.split(' ')
    self.first_name = names.shift
    self.last_name = names.join(' ') unless names.blank?
    full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def born_in_the_past
    errors.add(:dob, 'Must be in the past') unless dob && dob < Date.current
  end
end
