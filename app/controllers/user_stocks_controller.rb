class UserStocksController < ApplicationController
    #action against add to portfolio button
        def create
            #first check stock object from db table 
            stock = Stock.check_db(params[:ticker])
            #if not present in db table then we get it from newlookup method and save it to db
            if stock.blank?
              stock = Stock.new_lookup(params[:ticker])
              stock.save
            end  
              #then we pass stock obj to create userstock
            @user_stock = UserStock.create(user: current_user, stock: stock)
            flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
            redirect_to my_portfolio_path
        end
        def destroy
            #first we find stock on base of id sent from list.html.erb user_stock(stock) delete method
            stock=Stock.find(params[:id])
            #now we find USERSTOCK on base of curent_user id and stock id of stock we find above
            user_stock=UserStock.where(user_id: current_user.id,stock_id: stock.id).first
            user_stock.destroy
            flash[:notice]="stock deleted successfully"
            redirect_to my_portfolio_path
        end

end
