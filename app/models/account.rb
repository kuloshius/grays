# == Schema Information
# Schema version: 20110313144915
#
# Table name: accounts
#
#  id            :integer(4)      not null, primary key
#  reference     :string(255)     not null
#  name          :string(255)     not null
#  street        :string(255)
#  city          :string(255)
#  county        :string(255)
#  postcode      :string(255)
#  account_id    :integer(4)
#  credit_limit  :decimal(11, 2)
#  payment_delay :integer(4)
#  in_advance    :boolean(1)
#  created_at    :datetime
#  updated_at    :datetime
#  active        :boolean(1)
#

class Account < ActiveRecord::Base

  before_validation_on_create :update_defaults

  acts_as_audited

#relationships
  has_many :children, :foreign_key => "account_id", :class_name => "Account"
  belongs_to :parent, :foreign_key => "account_id", :class_name => "Account"

#attr accesibility

   attr_accessible :reference,
                   :name,
                   :street,
                   :city,
                   :county,
                   :postcode,
                   :credit_limit,
                   :payment_delay,
                   :in_advance,
                   :active,
                   :account_id,
                   :email,
                   :phone,
                   :fax

#validations
  validates :reference, :presence => true,
                        :uniqueness => true,
                        :length => {:maximum => 8}
  validates :name,      :presence => true
  validates :postcode,  :presence => true
  validates :credit_limit, :presence => true
  validates :payment_delay, :presence => true

  def address
    str = ""
    str += street.to_s unless street.nil?
    str += "\n" + city.to_s unless city.nil?
    str += "\n" + county.to_s unless county.nil?
    str += "\n" + postcode.to_s unless postcode.nil?
  end

  def contact
    str = ""
    str += "Phone: #{phone.to_s}" unless phone.nil?
    str += "\nFax: #{fax.to_s}" unless fax.nil?
    str += "\nEmail: #{email.to_s}" unless email.nil?
  end

  private

  def update_defaults
   self.credit_limit ||= 100
   self.payment_delay ||= 30
   self.in_advance = true if self.in_advance.nil?
   self.active = true if self.active.nil?
  end

end
