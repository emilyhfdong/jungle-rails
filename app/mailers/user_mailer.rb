class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order, order_id, line_items)
    @line_items = line_items
    @order = order
    @order_id = order_id
    mail(to: @order.email, subject: "order id: #{@order_id}")
  end
end
