class UserHistoricDatum < ApplicationRecord
    belongs_to :user

    def self.update_users_net_worth
        current_stock_prices = {}

        # Update net_worth of all users
        User.find_each do |user|
            net_worth = user.currency
            user.user_owned_stocks.each do |owned_stock|
                # Cache stock price in the hash - better performance
                stock_id = owned_stock.stock_id
                if current_stock_prices[stock_id] == nil
                    current_stock_prices[stock_id] = Stock.find(stock_id).current_price
                end

                stock_worth = current_stock_prices[stock_id] * owned_stock.quantity_owned
                net_worth = net_worth + stock_worth
            end
            
            # If net_worth is same as last time, don't make a new record
            last_entry = UserHistoricDatum.where(user_id: user.id).last
            if (last_entry != nil) && (last_entry.net_worth == net_worth)
                last_entry.touch
            else
                new_data_entry = UserHistoricDatum.new(user_id: user.id, net_worth: net_worth)
                new_data_entry.save
            end
            
        end
    end

end
