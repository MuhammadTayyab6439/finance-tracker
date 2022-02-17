class UsersController < ApplicationController
  def my_portfolio
    @stocks_user=current_user.stocks.all
  end
  
  def my_friends
    @my_friends=current_user.friends.all
  end
end
