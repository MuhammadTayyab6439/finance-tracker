class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :friendships
  has_many :friends, through: :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  #this method return true if stock already present in db        
  def stock_already_tracked?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?    
  end
  
  #this method return true if stock limit less than 10
  def under_stock_limit?
    stocks.count < 10
  end

  #this method uses above two methods and return true only if stock is not present in db and stock count less than 10
  def can_track_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_tracked?(ticker_symbol)
  end



  #this method provides full name by joining firstname and lastname if they present otherwise return unknown
  def fullname
    return "#{first_name} #{last_name}" if first_name || last_name
    "unknown"
  end




  #this method get param as input from user then strip it(remove spaces) then send search result
  #on basis of user input either it is first_name,last_name,email by calling below methods
  def self.search(param)
    param.strip!
    to_send_back = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end

  #this method calls a method matches and provide firstname as field name and param field(recieve from search method)
  def self.first_name_matches(param)
    matches('first_name', param)
  end

 #this method calls a method matches and provide lastname as field name and param field(recieve from search method)
  def self.last_name_matches(param)
    matches('last_name', param)
  end

 #this method calls a method matches and provide email as field name and param field(recieve from search method)
  def self.email_matches(param)
    matches('email', param)
  end

#this method is used in above three methods and above three methods are used in search method
  def self.matches(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end

  #this method ensure that current logged in user can't show in search result
  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

  #this method return true if users are not friend of each other
  def not_friends_with?(id_of_friend)
    !self.friends.where(id: id_of_friend).exists?
  end
end
