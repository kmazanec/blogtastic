class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  # Remember to create a migration!
  validates :name, { presence: true, uniqueness: true }

  before_validation :downcase
  before_create :downcase

  def downcase
    name.downcase!
  end

end
