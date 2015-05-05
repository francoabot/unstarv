class CommentsController < ApplicationController
#
 def index
    @comments =Comment.all.paginate(page: params[:page])
  end

 def show
    @comment = Comment.find(params[:id])
    @post = @Comment.post
  end

  def new
  end

 
 def create
   post = Post.find(params[:post_id])
  @comment = post.comments.build(comment_params)
  if @comment.save
    flash[:success] = "Comment created"
    redirect_to :back
  else
    render 'new'
  end
end
    


   def edit
   	@comment = Comment.find(params[:id])
   end

   def update
      @comment = comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated"
      redirect_to @comment.post
    else
      render 'edit'
    end
    end

    def destroy
    	Comment.find(params[:id]).destroy
        flash[:success] = "Comment deleted"
        redirect_to users_url
    end 



    
  
  private
    def comment_params
      params.require(:comment).permit(:author_name, :body)
    end

end
