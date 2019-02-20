module UsersHelper
  def isAdmin
    Usertype.find(current_user.user_type) == 1
  end
  def isCustomer
    Usertype.find(current_user.user_type) == 2
  end
  def isAgent
    Usertype.find(current_user.user_type) == 3
  end
end
