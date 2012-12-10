require 'rubygems'
require 'active_merchant'

# Use the TrustCommerce test servers
ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
    :login => 'TestMerchant',
    :password => 'password')

# ActiveMerchant accepts all amounts as Integer values in cents
amount = 1000  # $10.00

# The card verification value is also known as CVV2, CVC2, or CID
credit_card = ActiveMerchant::Billing::CreditCard.new(
    :first_name         => 'Bob',
    :last_name          => 'Bobsen',
    :number             => '4111111111111111',
    :month              => '8',
    :year               => '2013',
    :verification_value => '123')

# Validating the card automatically detects the card type
if credit_card.valid?
  # Capture $10 from the credit card
  response = gateway.purchase(amount, credit_card, purchase_options)

  if response.success?
    puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
  else
    puts "unsuccessful"

    raise StandardError, response.message
  end
end


def purchase_options
  {
      :billing_address => {
          :name     => "www",
          :address1 => "address1",
          :city     => "city",
          :state    => "state",
          :country  => "US",
          :zip      => 01111
      }
  }
end