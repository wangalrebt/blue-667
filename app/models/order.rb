class Order < ActiveRecord::Base
  attr_accessor :card_number, :card_verification, :address1, :address2, :city, :state, :zip_code, :name
  attr_accessible :card_number, :card_verification, :card_type, :card_expires_on, :first_name, :last_name, :cart_id,
                  :address1, :address2,:city, :state, :zip_code, :name, :user_address_attributes, :order_type_id, :user_id

  belongs_to :order_type
  has_one :user_address, :foreign_key => "order_id"
  accepts_nested_attributes_for :user_address
  belongs_to :user
  belongs_to :cart, :foreign_key => "cart_id", :primary_key => "id"
  has_one :event
  validate :validate_card, :on => "create"
  validates_presence_of :card_number, :card_expires_on, :address1, :city, :state, :zip_code, :first_name, :last_name



  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card)
    response.success?
  end

  def price_in_cents
    (cart.total_price*100).round
  end

  private

  def purchase_options
    {
        :ip => ip_address,
        :billing_address => {
            :name     => name,
            :address1 => address1,
            :city     => city,
            :state    => state,
            :country  => "US",
            :zip      => zip_code
        }
    }
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors[:base] << message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => card_type,
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expires_on.month,
        :year               => card_expires_on.year,
        :first_name         => first_name,
        :last_name          => last_name
    )
  end
end
