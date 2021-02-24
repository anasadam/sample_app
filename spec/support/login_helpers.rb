module LoginHelpers

# Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user, password: "123456", remember_me: "1")
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } } 
end

def log_in_with_session(user)
    session[:user_id] = user.id
end
  
end 