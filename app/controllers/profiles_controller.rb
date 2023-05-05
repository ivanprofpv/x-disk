class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[ show edit update ]
  before_action :find_profile, only: %i[show update]

  def show
  end

  def edit
  end

  def update
    total_space_self_user = Profile.total_space_self_user_method
    if total_space_self_user >= @profile.space
      redirect_to profile_path, notice: 'File not uploaded because 10 MB limit exceeded.'
    else
      if @profile.update(profile_params)
        redirect_to profile_path, notice: 'Profile was successfully updated.'
      else
        render :show
      end
    end
  end

  def set_profile
    @profile = current_user.profile || current_user.create_profile
  end

  private

  def find_profile
    @profile = Profile.find_by(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:space, attachments: [])
  end
end
