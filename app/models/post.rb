class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  # Remember to create a migration!

  validates :title, presence: true
  validates :content, presence: true

  def short_date
    created_at_date = self.created_at
    "#{created_at_date.month}-#{created_at_date.day}-#{created_at_date.year}"
  end
  def tags_as_string
    self.tags.map do |tag|
      tag.name
    end.join(', ')
  end
end
