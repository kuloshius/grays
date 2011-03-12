Factory.define :user do |u|
  u.email 'tomas@ebox.lt'
  u.password 'asdasd'
  u.confirmed_at Time.now
end
