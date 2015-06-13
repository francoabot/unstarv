class Groupcomment < ActiveRecord::Base
	belongs_to :user
	belongs_to :groupost
	belongs_to :group
	
    validates :body, presence: true, length: { minimum:5}
end
