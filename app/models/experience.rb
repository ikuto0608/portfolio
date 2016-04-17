class Experience < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :year, presence: true
  validates :language, presence: true

end
