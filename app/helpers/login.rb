helpers do

  def logged_in?
    if session[:user_id]
	session[:user_id]
    else
	nil
    end
  end

  def logged_in_id
    session[:user_id]
  end

  def logged_in_user
    User.find(session[:user_id])
  end

end
