require 'faker'
namespace :db do
  desc "Fill database with sample data"
    task :populate => :environment do
      Rake::Task['db:reset'].invoke
      User.create!(:email => "tomas@ebox.lt",
                   :password => "asdasd")
      created = {}
    99.times do |n|
      name = Faker::Company.name
      refnum = 0
      reference = name[0..3] + "0001".upcase
      while ! created[reference].nil? do
        refnum += 1
        reference = reference[0..5] + refnum.to_s
        if reference.length == 7
          reference = reference[0..3] + "0" + reference[4..6]
        end
      end
      created[reference]=""

      parent = (1+rand(10)).to_i if n > 10
      credit = 1000 * rand(10)
      terms = 60 if credit > 5000
      advance = false if rand(2) == 0
      active = false if rand(2) == 0
      Account.create!(:reference => reference.upcase,
                      :name => name,
                      :street => Faker::Address.street_address,
                      :city => Faker::Address.city,
                      :county => Faker::Address.uk_county,
                      :postcode => Faker::Address.uk_postcode,
                      :account_id => parent,
                      :credit_limit => credit,
                      :payment_delay => terms,
                      :in_advance => advance,
                      :active => active,
                      :email => Faker::Internet.email,
                      :phone => Faker::PhoneNumber.phone_number,
                      :fax => Faker::PhoneNumber.phone_number)

    end
  end
end

