class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :body,  presence: true, length: { minimum: 10 }
   


   def is_empty
   	return true if this.body.empty?

   end
end