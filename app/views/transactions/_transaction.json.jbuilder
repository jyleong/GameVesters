json.extract! transaction, :id, :user_id, :stock_id, :current_stock_val, :quantity, :total_price, :buy_sell, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)