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
    @groupost = @group.grouposts.build
    @Post = @group.grouposts
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




   def join_group
        @group = Group.find(params[:id])

        current_user.groups << @group
        if current_user.in_group?(@group)
        flash[:success] = "You have successfully joined #{@group.group_name}"
        redirect_to @group

        else
          flash[:failure] = "Trying contacting the group admin or try again"
          redirect_to @group
        end

   end




     def leave_group
         @group = Group.find(params[:id])
         current_user.groups.destroy(@group)
         if !current_user.in_group?(@group)
           flash[:success] = "You successfully left the group #{@group.group_name}"
           redirect_to current_user

         else
           fash[:failure] = "Sorry try again or contact the group admin to remove you"
           redirect_to @group


     end
   end

     #def add_admin(user)
           #@group = Group.find(params[:id])
           
     #end




private 

def group_params
params.require(:group).permit(:group_name,:type,:privacy_type,:description, :country, :state, :score)

end


 
end



