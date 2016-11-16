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
    
    @transaction = Transactions.find(params[:id])
  end

  # GET /transactions/new
  # no need for new page
  def new
    @stock = Stock.find_by_symbol(params[:symbol])
    @buy_sell = params[:buy_sell]
    
    default_amount = 10000
    transaction_quantity = (default_amount / @stock.current_price).round
    
    @transaction = Transaction.new(
        total_price: @stock.current_price * transaction_quantity,
        quantity: transaction_quantity
    )

    respond_to do |f|
      f.html
      f.js
    end
  end

  # POST /transactions
  # POST /transactions.json
  def create
    # @transaction = Transaction.new(transaction_params)
    @symbol = Stock.find(params[:stock_id])
    current_stock = StockQuote::Stock.quote(symbol)
    total_price = current_stock.ask * params[:transaction[:quantity]]
    @stock_id = params[:stock_id]
    @stock_price = params[:stock_price]
    @transaction = user.transactions.create(
      user_id: current_user.id, 
      stock_id: @stock_id, 
      quantity: params[:transaction[:quantity]], 
      current_stock_val: current_stock.ask, 
      total_price: total_price)
    
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
      params.require(:transaction).permit(:user_id, :stock_id, :current_stock_val, :quantity, :total_price, :buy_sell)
    end

    def getUser()
      return User.find(params[:user_id])
    end

    def fillRestFields()

    end
end
