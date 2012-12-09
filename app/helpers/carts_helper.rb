module CartsHelper
  def get_email(user)
    if user.nil?
      email = "unregister user"
    else
      email = user.email
    end
    return email
  end

end
