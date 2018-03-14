class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.creator_id = current_user.id

    if @user.save
      flash[:notice] = 'Succefully created user ' + @user.name
    else
      flash[:alert] = @user.errors
    end

    redirect_to user_url(current_user)
  end

  def show
    @sub_users = current_user.all_descendants
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # good old way
    # @user = User.new(user_params)

    # overwrite
    # user_params.reject { |k,v| v.blank? }.each do |k,v|
    #   @user.public_send("#{k}=", v)
    # end

    # smartass way
    @user = User.find(params[:id])

    if @user.update_attributes(user_params.reject { |k,v| v.blank? })
      flash[:notice] = 'Succefully updated user ' + @user.name
      return redirect_to new_user_session_url if user_params[:password].present?
    else
      flash[:alert] = @user.errors
    end

    redirect_to user_url(current_user)
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      flash[:notice] = 'Succefully deleted user ' + user.name
    else
      flash[:alert] = user.errors
    end

    redirect_to user_url(current_user)
  end

  def upload
    @user = current_user
  end

  # def file_path(path)
  #   starts_at = path =~ /\/public(.+)/
  #   path[starts_at..-1]
  # end

  # def files
  #   @files = current_user.files
  # end

  private

  def user_params
    # think about those
    params.require(:user).permit(:name, :role, :email, :password, :password_confirmation, { files: [] })
  end
end
