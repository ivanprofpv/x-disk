module ProfilesHelper
  def total_space_user
    @total_space = @profile.space / 1048576
  end

  def total_space_self_user
    Userfile.total_space_self_user_method
  end
end
