class UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]
 before_action :authenticate_user! 

  def index
    @users = User.all
  end 

  # GET /users/:id.:format
  def show
     #authorize! :read, @user
     @user = User.find(params[:id])
      @posts = @user.posts.paginate(page: params[:page])
    
  end
 
  # GET /users/:id/edit
  def edit
    #authorize! :update, @user
  end
  def new
    @user = User.new
  end

  # PATCH/PUT /users/:id.:format
  #def update
     #authorize! :update, @user
    #respond_to do |format|
      #if @user.update(user_params)
      #  sign_in(@user == current_user ? @user : current_user, :bypass => true)
       # format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
       # format.json { head :no_content }
      #else
       # format.html { render action: 'edit' }
       # format.json { render json: @user.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    authorize! :update, @user 
    if request.patch? && params[:user] && params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
     authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  def set_user
      @user = User.find(params[:id])
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
    end

    def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
    end
  
 
    
   private
    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(:database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable,:encrypted_password, :confirmed_at, :username, :firtname, :lastName, :country, :state, :profession, :industry)
   
  end
end