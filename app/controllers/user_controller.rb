class UserController < ApplicationController

  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:welcome]

  def new
    @user = Users.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    respond_with_article_or_redirect
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def upgrade
    @user = User.find(params[:id])
    redirect_to new_subscription_path
  end

  def downgrade
    current_user.update_attributes(role: 'standard')
    redirect_to edit_user_registration_path
  end




  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :role)
    end

    def secure_params
      params.require(:user).permit(:role)
    end

    def respond_with_article_or_redirect
      # If an old id or a numeric id was used to find the record, then
      # the request path will not match the post_path, and we should do
      # a 301 redirect that uses the current friendly id.
      if request.path != article_path(@article)
        return redirect_to @article, status: :moved_permanently
      else
        return respond_with @article
      end
    end


end
