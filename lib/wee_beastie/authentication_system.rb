module WeeBeastie::AuthenticationSystem
  #this is a shell that Wee Beastie uses to query the current user - overide in your app controller

  protected
  
  # this is used to keep track of the last time a user has been seen (reading a topic)
  # it is used to know when topics are new or old and which should have the green
  # activity light next to them
  #
  # we cheat by not calling it all the time, but rather only when a user views a topic
  # which means it isn't truly "last seen at" but it does serve it's intended purpose
  #
  # this could be a filter for the entire app and keep with it's true meaning, but that
  # would just slow things down without any forseeable benefit since we already know
  # who is online from the user/session connection
  #
  # This is now also used to show which users are online... not at accurate as the
  # session based approach, but less code and less overhead.
  def update_last_seen_at
    return unless logged_in?
    current_user.update_attribute(:last_seen_at, Time.now.utc)
  end

  def authorized?()
    true
    # in your code, redirect to an appropriate page if not an admin
  end


  def admin?
    logged_in? && current_user.admin?
  end
end
