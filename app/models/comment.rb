class Comment < ActiveRecord::Base
include PublicActivity::Model
tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :post
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :body,  presence: true, length: { minimum: 10 }
  
  has_reputation :votes, source: :user, aggregated_by: :sum


   def is_empty
   	return true if this.body.empty?

   end
end