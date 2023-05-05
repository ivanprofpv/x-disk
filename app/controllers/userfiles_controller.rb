class UserfilesController < ApplicationController
  before_action :find_profile, only: %i[new create]

  def new
    @userfile = Userfile.new
  end

  def create
    @userfile = @profile.userfiles.new(userfile_params)
    if @userfile.save
      redirect_to profile_path, notice: 'File uploaded.'
    else
      render :new
    end
  end

  private

  def userfile_params
    params.require(:userfile).permit(:space, :attachment)
  end

  def find_profile
    @profile = Profile.find_by(params[:id])
  end
end
