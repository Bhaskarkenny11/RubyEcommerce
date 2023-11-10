class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.order_confirmation.subject
  #
  def order_confirmation(order)
    @order = order
 #binding.pry
    mail to: "#{order.user.email}", subject: "your order has been placed #{order.order_number}"
  end
end
