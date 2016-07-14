class OrdersController < ApplicationController
  before_action :logged_in_user

  def index
    @type_paid = "unpaid"
    @type_paid = params[:type] if params[:type].present?
    @orders = current_user.orders.show_orders(@type_paid).paginate page: params[:page], 
      per_page: 5
  end

  def show
    @order = current_user.orders.find_by_id params[:id]
    if @order.nil?
      flash[:danger] = t "order.nil"
      redirect_to admin_orders_path
    else
      @product_orders = @order.product_orders
    end
  end
end
