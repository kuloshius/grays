# == Schema Information
# Schema version: 20110302220336
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
#  status_id     :integer(4)
#  account_id    :integer(4)
#  credit_limit  :decimal(11, 2)
#  payment_delay :integer(4)
#  in_advance    :boolean(1)
#  type_id       :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

class Account < ActiveRecord::Base

  acts_as_audited

#relationships
  belongs_to :status
  belongs_to :parent
  belongs_to :type


end
