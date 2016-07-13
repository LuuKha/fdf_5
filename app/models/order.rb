class Order < ActiveRecord::Base
  has_many :product_orders, dependent: :destroy
  
  belongs_to :user

  scope :desc_created_at, -> {order created_at: :desc}
  scope :show_unpaid_orders, -> {where is_paid: false}
  scope :show_paid_orders, -> {where is_paid: true}
end
