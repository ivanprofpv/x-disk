class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[ show edit update ]

  def show
    # @checksize = ActiveStorage::Blob.where(id: current_user.id).map(&:byte_size).sum
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
    @profile = Profile.with_attached_attachments.find(current_user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:space, attachments: [])
  end
end
