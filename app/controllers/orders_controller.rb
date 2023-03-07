class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
  @orders = current_user.order.all
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

  # POST /orders or /orders.json
  def create
       @order = current_user.order.new(order_params)
       if @order.save
        NotificationMailer.create_notification(@order).deliver_now
         current_cart.cart_items.delete_all
         flash.notice = "Your Order Has Been Successfully Placed!"
         redirect_to payment_path
       else
         flash.alert = "Your Order Cannot be Placed at the moment, Please try later!"
         redirect_to home_index_path
       end
     end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        NotificationMailer.update_notification(@order).deliver_now
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
     NotificationMailer.delete_notification(@order).deliver_now
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

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :quantity, :user_id)
    end
end
