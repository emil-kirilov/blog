class FilesController < ApplicationController
  def create
    unless params.dig(:user, :files)
      flash[:alert] = 'Select file(s)!'
      return render :new
    end

    user = current_user
    user.files += params[:user][:files]

    if user.save
      flash[:notice] = 'File(s) were saved!'
    else
      flash[:alert] = user.errors
    end
    redirect_to user_url(user)
  end
end
