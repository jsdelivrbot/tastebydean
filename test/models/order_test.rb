# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  serial            :string
#  status            :string
#  delivery_method   :string
#  title             :string
#  name              :string
#  surname           :string
#  address           :string
#  zipcode           :string
#  city              :string
#  country           :string
#  phone             :string
#  subtotal          :decimal(12, 3)   default("0")
#  shipping_fees     :decimal(12, 3)   default("0")
#  tax_fees          :decimal(12, 3)   default("0")
#  share_discount    :decimal(, )      default("0")
#  num_discount      :decimal(12, 3)   default("0")
#  total             :decimal(12, 3)   default("0")
#  price_unit_id     :integer
#  payment_method    :string
#  payment_type      :string
#  payment_status    :string
#  creation_date     :datetime
#  validation_date   :datetime
#  confirmation_date :datetime
#  expedition_date   :datetime
#  payment_date      :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_orders_on_price_unit_id  (price_unit_id)
#  index_orders_on_user_id        (user_id)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
