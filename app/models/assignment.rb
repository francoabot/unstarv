class Assignment < ActiveRecord::Base
	include PublicActivity::Model
    tracked owner: ->(controller, model) { controller && controller.current_user }
	groupify :group_member
end
