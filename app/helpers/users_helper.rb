module UsersHelper
  def isAdmin()
    if Usertype.find(current_user.user_type) == 1
      true
    else
      false
    end
  end
  def isCustomer
    Usertype.find(current_user.user_type) == 2
  end
  def isAgent
    Usertype.find(current_user.user_type) == 3
  end
end
