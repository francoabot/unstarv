class Groupost < ActiveRecord::Base
include PublicActivity::Model
tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :group
  belongs_to :user
  has_many :groupcomments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :content, presence: true, length: { minimum: 25 }
end
