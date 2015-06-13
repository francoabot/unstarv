class Groupost < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :content, presence: true, length: { minimum: 80 }
end
