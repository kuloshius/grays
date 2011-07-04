require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do

    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector('title', :content => 'Sign in')
    end
    
  end
  
  describe "POST 'create'" do
  
    context "with wrong credentials" do
    
      before(:each) do
        @user = Factory(:user)
        @attr = {:email => @user.email, :password => "wrongpassword"}
      end
      
      it "should re-render the new page" do
        post :create, :session => @attr
        response.should render_template('new')
      end
      
      it "should have the right title" do
        post :create, :session => @attr
        response.should have_selector('title', :content => 'Sign in')
      end
      
      it "should have an error message" do
        post :create, :session => @attr
        flash.now[:alert] =~ /invalid/i
      end
      
    end
    
    context "with correct credentials" do
      
      before(:each) do
        @user = Factory(:user)
        @attr = {:email => @user.email, :password => @user.password}
      end
      
      it "should sign the user in" do
        post :create, :email => @user.email, :password => @user.password
        session[:user_id].should == @user.id
        controller.current_user.should == @user
      end
      
      it "should redirect to the user show page" do
        post :create, :email => @user.email, :password => @user.password
        response.should redirect_to(user_path(@user))
      end
      
    end
    
  end
  
  describe "DELETE 'destroy'" do
    it "should sign a user out when user is signed in" do
      @user = Factory(:user)
      post :create, :email => @user.email, :password => @user.password
      delete :destroy
      controller.current_user.should be_nil
      response.should redirect_to(root_path)
    end
    
    it "should redirect to root_path when user is not signed in" do
      controller.current_user.should be_nil
      delete :destroy
      response.should redirect_to(root_path)
    end
  end

end
