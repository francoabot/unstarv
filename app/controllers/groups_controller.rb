class GroupsController < ApplicationController
  before_action :authenticate_user! 


 
  def index
    @groups = Group.all
  end

  def template

  end
   
    def new
    @group = Group.new
   end

  def create
    @group = Group.new(group_params)
     if @group.save
   
      flash[:success]= "Group #{@group.group_name} successfully created"
      redirect_to @group
    else
      render 'new'
  end
end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
   @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash.now[:success] = "Group updated !"
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash.now[:success] = "Group #{@group.group_name} successfully destroyed"
  end


private 

def group_params
params.require(:group).permit(:group_name,:type,:privacy_type,:description)

end


 
end



