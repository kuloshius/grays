module Macros
  def login
    before(:each) do
      @request.env["devise.mapping"] = :user
      sign_in Factory.create(:user)
    end
  end
end
