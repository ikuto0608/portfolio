class Skill < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :degree, presence: true
  validates :type, presence: true
end
