class Admin::OrdersController < ApplicationController
  before_action :logged_in_user, :admin_user

  def index
    @type_paid = "unpaid"
    @type_paid = params[:type] if params[:type].present?
    @orders = Order.where nil
    if @type_paid == "unpaid"
      @orders = @orders.show_unpaid_orders
    elsif @type_paid == "paid"
      @orders = @orders.show_paid_orders
    end
    @orders = @orders.desc_created_at.paginate page: params[:page], :per_page => 4
  end

  def show
    @order = Order.find_by_id params[:id]
    if @order.nil?
      flash[:danger] = t "order.nil"
      redirect_to admin_orders_path
    end
    @product_orders = @order.product_orders
  end

  def update
    @order = Order.find params[:id]
    if @order.nil?
      flash[:danger] = t "order.nil"
      redirect_to admin_orders_path
    end
    @order.is_paid = true
    @order.paid_at = Time.now
    if @order.save
      flash[:success] = t "order.success"
      redirect_to :back
    else
      flash[:danger] = t "order.fail"
    end
  end

  def destroy
    @order = Order.find params[:id]
    if @order.nil?
      flash[:danger] = t "order.nil"
      redirect_to admin_orders_path
    end
    if @order.destroy
      flash[:success] = t "order.destroy"
      redirect_to admin_orders_path
    end
  end
end
