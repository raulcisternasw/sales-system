class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_users, only: %i[ new edit ]
  before_action :set_subscriptions, only: %i[ new edit ]
  before_action :set_status, only: %i[ new edit ]
  before_action :set_payment_type_codes, only: %i[ new edit ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # Method to create a transaction
  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id

    respond_to do |format|
      if @order.save
        transaction  = create_transaction
        @order.token = transaction["token"]
        @order.save!
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # Method to confirm a transaction
  def webpay_commit
    @order      = Order.find_by(token: params[:token_ws])
    response    = Orders::Webpay.commit(@order.token)
    transaction = OpenStruct.new(response)
    @order.set_transaction_data(transaction)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully confirm." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # Method to get status of a transaction
  def webpay_status
    @order      = Order.find_by(token: params[:token])
    response    = Orders::Webpay.status(@order.token)
    transaction = OpenStruct.new(response)
    @order.set_transaction_data(transaction)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully status." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_users
      @users = User.all.collect { |user| [ "#{ user.first_name } #{ user.last_name }", user.id ] }
    end

    def set_subscriptions
      @subscriptions = Subscription.all.collect { |subscription| [ subscription.name, subscription.id ] }
    end

    def set_status
      @status = Order.statuses.keys.collect { |status| [ status.humanize, status ] }
    end

    def set_payment_type_codes
      @payment_type_codes = Order.payment_type_codes.keys.collect { |payment_type_code| [ payment_type_code.humanize, payment_type_code ] }
    end

    # Method to create a transaction according to payment method
    def create_transaction
      session_id = @order.generate_session_id
      return_url = @order.generate_return_url
      response   = Orders::Webpay.create(@order.buy_order, session_id, @order.amount.to_i, return_url) rescue {}
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :subscription_id, :buy_order, :token, :amount, :status, :card_number, :transaction_date, :payment_type_code, :installments_amount, :installments_number, :balance, :authorization_code, :authorization_date, :nullified_amount)
    end
end
