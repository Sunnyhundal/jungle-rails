class UsersController < ApplicationController
  def new
  end
# If the user saves, set the session user_id to the new user's id and redirect them to the root path, otherwise redirect them to the signup path.
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
end

private
#  Define a new method called user_params that returns the list of allowed parameters from the params object.
def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
end
end
