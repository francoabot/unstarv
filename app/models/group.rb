class Group < ActiveRecord::Base
	self.inheritance_column = nil
	groupify :group, members: [:users, :assignments], default_members: :users
	has_many :posts



	TYPE = ["Immediate Feedback needed", "Artistic Interest","Project Mates Matching"]



	PRIVACY_TYPE = [ "Private", "Public", "Invite only",  ]
	CATEGORY = ["Short stories", "Novelists",  "Poets",  "Photographers", "Comic", "Screenwriters", "Singers",  "Songwriter", "Painters",  "Graphic Design",  "Illustrators",  "Actors"]
end
