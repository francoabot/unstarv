class Group < ActiveRecord::Base
	include PublicActivity::Model
    tracked owner: ->(controller, model) { controller && controller.current_user }
    acts_as_messageable

	self.inheritance_column = nil
	groupify :group, members: [:users, :assignments], default_members: :users
	
	has_many :grouposts, dependent: :destroy
	has_many :groupcomments, :through => :grouposts,  dependent: :destroy
    


	TYPE = ["Immediate Feedback needed", "Artistic Interest","Project Mates Matching"]



	PRIVACY_TYPE = [ "Private", "Public", "Invite only",  ]
	CATEGORY = ["Short stories", "Novelists",  "Poets",  "Photographers", "Comic", "Screenwriters", "Singers",  "Songwriter", "Painters",  "Graphic Design",  "Illustrators",  "Actors"]

     def groupfeed
        Groupost.where("group_id = ?", id)
     end
     

    



    def group_member?(user)


     end




      def add_member(user)  
       user.groups << self 
       end

      def remove_member(user)
         user.groups.destroy(self)
      end

end
