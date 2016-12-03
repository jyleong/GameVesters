class TransactionsController < ApplicationController
  before_action :set_transaction, only: :show
  before_action :logged_in_user ,only: [:index, :create, :show, :new]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all

  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])
  end

  # GET /transactions/new
  # no need for new page
  def new
    @stock = Stock.find_by_symbol(params[:symbol])

    default_amount = 10000
    transaction_quantity = (default_amount / @stock.current_price).round

    @transaction = Transaction.new(
        total_price: @stock.current_price * transaction_quantity,
        quantity: transaction_quantity,
        buy_sell: params[:buy_sell]
    )

    respond_to do |f|
      f.html
      f.js
    end
  end

  # POST /transactions
  # POST /transactions.json
  def create
    curr_transaction_params = transaction_params

    @stock = Stock.find_by_symbol(params[:stock_symbol])
    total_price = @stock.current_price * curr_transaction_params[:quantity].to_i

    # Record transaction
    curr_transaction_params[:user_id] = current_user.id
    curr_transaction_params[:stock_id] = @stock.id
    curr_transaction_params[:current_stock_val] = @stock.current_price
    curr_transaction_params[:total_price] = total_price

    @transaction = Transaction.new(curr_transaction_params)

    # Buy operation
    if transaction_params[:buy_sell] == "true"

        # Check if user has enough money
        if current_user.currency < total_price
            @transaction.errors.add(:total_price, :invalid, message: "is too expensive. You do not have enough money.")
        else
            # Subtract from user's money
            current_user.subtract_currency(total_price)

            # Add to user's owned stocks
            current_user.add_owned_stock(@transaction)
        end

    # Sell operation
    else

        # Check if user has enough stocks to sell
        num_stocks = current_user.user_owned_stocks.find_by(stock_id: @transaction.stock_id).quantity_owned
        if num_stocks < @transaction.quantity
            @transaction.errors.add(:quantity, :invalid, message: "is too high. You do not own that many stocks.")
        else
            # Add to user's money
            current_user.add_currency(total_price)

            # Remove from user's owned stocks
            current_user.remove_owned_stock(@transaction)
        end

    end

    respond_to do |f|
      if @transaction.errors.count == 0 and @transaction.save
        f.json { render :show, status: :created, location: @transaction }
        f.js
      else
        #f.json { render json: @transaction.errors, status: :unprocessable_entity }
        f.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:stock_id, :quantity, :total_price, :buy_sell)
    end

end
