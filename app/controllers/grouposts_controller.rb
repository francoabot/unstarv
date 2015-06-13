class GroupostsController < ApplicationController
  before_action :authenticate_user! 



def show
end
def create
	@group = Group.find(params[:group_id])
    @groupost = @group.grouposts.build(groupost_params) #Find way to provide group id
    @groupost.user_id = current_user.id
    if @groupost.save
      flash[:success] = "Post created!"
      redirect_to @group
    else
      redirect_to @group
    end
  end

    def destroy
    end


  private

    def groupost_params
      params.require(:groupost).permit(:content, :user_id, :group_id)
    end






















end
