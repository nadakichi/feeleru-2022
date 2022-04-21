class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @businesses = current_user.businesses
  end

end
