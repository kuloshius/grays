Factory.define :user do |u|
  u.email 'admin@grays.com'
  u.password 'asdasd'
  u.confirmed_at Time.now
end
