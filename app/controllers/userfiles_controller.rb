class UserfilesController < ApplicationController
  before_action :find_profile, only: %i[new create]
  before_action :find_userfile, only: %i[destroy show]

  def new
    @userfile = Userfile.new
  end

  def show
  end

  def create
    if total_space_self_user >= @profile.space
      redirect_to profile_path, notice: 'File not uploaded because 10 MB limit exceeded.'
    else
      @userfile = @profile.userfiles.new(userfile_params)
      if @userfile.save
        redirect_to profile_path, notice: 'File uploaded.'
      else
        render :new
      end
    end
  end

  def destroy
    if @userfile.destroy
      redirect_to profile_path, notice: 'File deleted.'
    end
  end

  private

  def total_space_self_user
    Userfile.total_space_self_user_method(@profile.userfiles)
  end

  def userfile_params
    params.require(:userfile).permit(:space, :attachment)
  end

  def find_profile
    @profile = Profile.find_by(user_id: current_user)
  end

  def find_userfile
    @userfile = Userfile.find(params[:id])
  end
end
