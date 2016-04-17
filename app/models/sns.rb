class Sns < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :url, presence: true
  validates :kind, presence: true
end
