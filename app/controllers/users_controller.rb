class UsersController < ApplicationController
  def my_portfolio
    @stocks_user=current_user.stocks.all
  end
end
