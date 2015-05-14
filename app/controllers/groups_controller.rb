class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    if @group.save
      flash.now[:success]= "Group #{@group.group_name} successfully created"
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
  end




  private 
  def group_params
      params.require(:type, :group_name)
  end
end



