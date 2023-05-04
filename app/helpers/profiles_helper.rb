module ProfilesHelper
  def total_space_user
    @total_space = @profile.space
  end

  # def total_space_self_user(user)
  #   user.joins(:attachments_blobs).sum("active_storage_blobs.byte_size")
  # end
end
