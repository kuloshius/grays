module AccountsHelper

  def credit_control(account)
    str = "Payment terms: #{account.payment_delay.to_i} days"
    str += "\nBilling: #{account.in_advance? ? "In Advance" : "In Arrears"}"
    str += "\nStatus: #{account.active? ? "Active" : "Closed"}"
  end

end
