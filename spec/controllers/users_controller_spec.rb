require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    
    context "when signed in" do
      
      before(:each) do
        test_sign_in(Factory(:user))
      end
      
      it "user show should be successful" do
        get 'show'
        response.should be_success
      end
    
      it "should have the right title" do
        get 'show'
        response.should have_selector('title', :content => "Home")
      end
      
      it "should have the company name which the user belongs to" do
        get 'show'
        response.should have_selector('h1', :content => "Grays Ltd.")
      end
      
      it "should show the welcome message for current user" do
        get 'show'
        response.should have_selector('div', :content => "Welcome admin@grays.com!")
      end
      
    end
    
    context "when not signed in" do
    
      it "should redirect to root_path" do
        get 'show'
        response.should redirect_to(root_path)
      end
      
    end
    
  end

end
