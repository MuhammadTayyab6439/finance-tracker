class StocksController < ApplicationController

    def search
        if params[:stock].present?               
            @stock=Stock.new_lookup(params[:stock])

           if @stock
            respond_to do |format|
                format.js { render partial: 'users/result.js' }
            end
           else

            respond_to do |format|
                flash.now[:alert]="please enter a valid symbol"
                format.js { render partial: 'users/result.js' }
            end
           
           end

        else
            respond_to do |format|
            flash.now[:alert]="please enter a symbol"
            format.js { render partial: 'users/result.js' }
            end
        end
    end


end