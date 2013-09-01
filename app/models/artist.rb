class Artist < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 80 }
  validates :email, presence: :true
end
