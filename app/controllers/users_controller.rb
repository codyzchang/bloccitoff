class UsersController < ApplicationController
  
   before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @items = @user.items.visible_to(current_user)

  end
  
   def update
     if current_user.update_attributes(user_params)
       flash.now[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash.now[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name)
   end
 end