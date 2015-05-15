class Group < ActiveRecord::Base
	groupify :group, members: [:users, :assignments], default_members: :users

	TYPE = ["Immediate Feedback needed", "Artistic Interest","Project Mates Matching"]



	PRIVACY_TYPE = [ "Private", "Public", "Invite only",  ]
end
