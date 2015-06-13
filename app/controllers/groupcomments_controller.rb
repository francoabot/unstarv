class GroupcommentsController < ApplicationController

	  before_action :authenticate_user! 
#
 def index
    @groupcomments =Groupcomment.all.paginate(page: params[:page])
  end

 def show
    @groupcomment = Groupcomment.find(params[:id])
    @groupost = @Groupcomment.groupost
  end

  def new
  end

 
 def create
   groupost = Groupost.find(params[:groupost_id])
  @groupcomment = groupost.groupcomments.build(groupcomment_params)
  @groupcomment.user = current_user
  if @groupcomment.save
    flash[:success] = "Comment created"
    redirect_to :back
  else
    render 'new'
  end
end
    


   def edit
   	@groupcomment = Groupcomment.find(params[:id])
   end

   def update
      @groupcomment = Groupcomment.find(params[:id])
    if @groupcomment.update_attributes(comment_params)
      flash[:success] = "Comment updated"
      redirect_to @groupcomment.post
    else
      render 'edit'
    end
    end

    def destroy
    	Groupcomment.find(params[:id]).destroy
        flash[:success] = "Comment deleted"
        redirect_to group_url
    end 


     def vote
      value = params[:type] == "up" ? 1 : -1
      @groupcomment = Groupcomment.find(params[:id])
      @groupcomment.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back
      flash.now[:success] = "Thank you for voting"
     end
    
  
  private
    def groupcomment_params
      params.require(:groupcomment).permit(:body)
    end

end
