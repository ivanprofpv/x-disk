class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[ show edit update ]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      render :show
    end
  end

  def set_profile
    @profile = current_user.profile || current_user.create_profile
  end

  private

  def profile_params
    params.require(:profile).permit(:space, attachments: [])
  end
end
