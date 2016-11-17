class TransactionsController < ApplicationController
  before_action :set_transaction, only: :show

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
    # user = getUser
    #@transactions = Transaction.where(user_id: user.id);
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

    puts @transaction.inspect

    respond_to do |f|
      f.html
      f.js
    end
  end

  # POST /transactions
  # POST /transactions.json
  def create
    curr_transaction_params = transaction_params

    stock = Stock.find_by_symbol(params[:stock_symbol])
    total_price = stock.current_price * curr_transaction_params[:quantity].to_i

    # Buy operation
    if (transaction_params.buy_sell == true)

        # Check if user has enough money

        # Subtract from user's money

        # Add to user's assets

    # Sell operation
    else

        # Check if user has enough stocks to sell

        # Add to user's money

        # Remove from user's assets

    end

    # Record transaction
    curr_transaction_params[:user_id] = current_user.id
    curr_transaction_params[:stock_id] = stock.id
    curr_transaction_params[:current_stock_val] = stock.current_price
    curr_transaction_params[:total_price] = total_price

    puts curr_transaction_params.inspect
    @transaction = current_user.transactions.create(curr_transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
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
      params.require(:transaction).permit(:stock_id, :quantity, :buy_sell)
    end

    def getUser()
      return User.find(params[:user_id])
    end

    def fillRestFields()

    end
end
