class Blogpost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 4 }
  validates :title,   presence: true
  default_scope -> { order('created_at DESC') }
end
