module ProfilesHelper
  def total_space_user
    @total_space = @profile.space
  end

  def total_space_self_user(profile)
    ActiveStorage::Attachment.joins(:blob).where(record: profile).sum(:byte_size)
  end
end
