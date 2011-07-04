require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :email => 'user@example.com',
      :password => 'asdasd',
      :password_confirmation => 'asdasd'
    }
  end
  
  it "should create a new instance given a valid attributes" do
    User.create!(@attr)
  end
  
  describe "emails" do
  
    it "should require email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end
    
    it "should reject duplicate email addresses" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
    
    it "should reject email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
    
  end
  
  describe "passwords" do
    
    before(:each) do
      @user = User.new(@attr)
    end
    
    it "should have a password attribute" do
      @user.should respond_to(:password)
    end
    
    it "should respond to password_confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do
    
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end
          
    it "should require a matchin password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
    end
    
  end
    
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should respond to password_hash attribute" do
      @user.should respond_to(:password_hash)
    end
    
    it "should set the password_hash attribute" do
      @user.password_hash.should_not be_blank
    end
    
    it "should respond to password_salt attribute" do
      @user.should respond_to(:password_salt)
    end
    
    it "should set the password_salt attribute" do
      @user.password_salt.should_not be_blank
    end
    
    describe "#encrypt_password" do
    
      it "should exist" do
        @user.should respond_to(:encrypt_password)
      end
      
    end
        
    describe ".authenticate" do
      
      it "should exist" do
        User.should respond_to(:authenticate)
      end
      
      it "should return nil on email/password missmatch" do
        User.authenticate(@attr[:email], "wrongpass").should be_nil
      end
      
      it "should return nil if email is not registered" do
        User.authenticate("non_existent@email.com", @attr[:password]).should be_nil
      end
      
      it "should return the user on email/password match" do
        User.authenticate(@attr[:email], @attr[:password]).should == @user
      end
      
    end
  
  end
  
end
