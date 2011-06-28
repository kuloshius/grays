require 'spec_helper'

describe PagesController do
  #this line is for rendering views inside controller. Without it rspec would test only controller actions. This ensures that if the test passes, the page is really there
  render_views

  describe "when logged in" do

    before(:each) do
      @base_title = "SLP | "
    end

    describe "GET 'home'" do
      it "should be successful" do
        get 'home'
        response.should be_success
      end

      it "should have the right title" do
        get 'home'
        response.should have_selector("title", :content => @base_title + "Home")
      end
    end

    describe "GET 'contact'" do
      it "should be successful" do
        get 'contact'
        response.should be_success
      end

      it "should have the right title" do
        get 'contact'
        response.should have_selector("title", :content => @base_title + "Contact")
      end
    end

    describe "GET 'about'" do
      it "should be successful" do
        get 'about'
        response.should be_success
      end

      it "should have the right title" do
        get 'about'
        response.should have_selector("title", :content => @base_title + "About")
      end
    end

    describe "GET 'help'" do
      it "should be successful" do
        get 'help'
        response.should be_success
      end

      it "should have the right title" do
        get 'help'
        response.should have_selector("title", :content => @base_title + "Help")
      end
    end
    after(:each) do
      response.should have_selector("div#framecontentTop")
      response.should have_selector("div#framecontentLeft")
      response.should have_selector("div#framecontentRight")
    end
  end

  describe "when not logged in" do

    it "should always redirect to login page" do
      get 'help'
      response.should redirect_to(new_user_session_path)
      get 'about'
      response.should redirect_to(new_user_session_path)
      get 'home'
      response.should redirect_to(new_user_session_path)
      get 'contact'
      response.should redirect_to(new_user_session_path)
    end

    it "should not have top, left and right menu's" do
      get 'help'
      response.should_not have_selector("div#framecontentTop")
      response.should_not have_selector("div#framecontentLeft")
      response.should_not have_selector("div#framecontentRigh")
    end
  end
end
