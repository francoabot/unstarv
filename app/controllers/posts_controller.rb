class PostsController < ApplicationController
  before_action :authenticate_user! 
  

   
    
   def index
    @posts = Post.all
   end

   def show
      @post = Post.find(params[:id])
      @comment = Comment.new
      @comment.post_id = @post.id
      @comments = @post.comments.all
    end

    def new
       @post = Post.new
    end


   def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'home/home'
    end
  end

  def edit
     @post = Post.find(params[:id])
  end
      def update
     @post = Post.find(params[:id])
     @post.update(post_params)
     flash.notice = "Post '#{@post.title}' Updated!"
     render 'home/home'
    end
      
     def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
     end


     def vote
      value = params[:type] == "up" ? 1 : -1
      @post = Post.find(params[:id])
      @post.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "Thank you for voting"
     end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
     
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :picture)
    end
end
