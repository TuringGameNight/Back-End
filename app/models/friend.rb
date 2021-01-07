class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :bud, class_name: 'User'

  validates :user_id, presence: true
  validates :bud_id, presence: true
end
