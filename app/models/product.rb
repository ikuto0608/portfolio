class Product < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :based_on, presence: true
  validates :degree, presence: true
end
