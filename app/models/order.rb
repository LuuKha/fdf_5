class Order < ActiveRecord::Base
  has_many :product_orders, dependent: :destroy
  
  belongs_to :user

  scope :show_orders, -> type{where is_paid: type=="paid"}
end
