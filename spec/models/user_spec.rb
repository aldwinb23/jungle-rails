require 'rails_helper'

RSpec.describe User, type: :model do

  before do

    @user1 = User.new(:name => "Aldwin", :email => "aldwin@bautista.com", :password => "12345")
    @user2 = User.new(:password => "12345", :password_confirmation => "12345")
    @user3 = User.new(:password => "12345", :password_confirmation => "54321")
    @user4 = User.new

    @user1.save
    @user2.save
    @user3.save
    @user4.save

  end


  describe 'Validations' do

    it "validates password and password_confirmation matches" do
      expect(@user2.password).to eql(@user2.password_confirmation)
    end

    it "validates password and password_confirmation does not match" do
      expect(@user3.password).not_to eql(@user3.password_confirmation)
    end

    it "validates password and password_confirmation is present" do
      expect(@user4.password).to be_nil
      expect(@user4.password_confirmation).to be_nil
    end

    it "validates case sensitive email if email is in database" do
      new_email = "AldwiN@BauTistA.cOm"
      expect(new_email.downcase).to eql(@user1.email)
    end

    it "validates if email is already in use" do
      new_email = "AldwiN@BauTistA.cOm"
      expect(new_email.downcase).to include(@user1.email)
    end


    it "validates name, email, and password is present" do
      expect(@user1.name).to be_present
      expect(@user1.email).to be_present
      expect(@user1.password_digest).to be_present
    end

    it "validates name, email, and password is not present" do
      expect(@user4.name).to be_nil
      expect(@user4.email).to be_nil
      expect(@user4.password_digest).to be_nil
    end

    it "validates password is greater/equal t0 5" do
      new_password = "12345"
      expect(new_password.length).to be >= 5
    end

    it "validates password is lesser than 5" do
      new_password = "1234"
      expect(new_password.length).to be < 5
    end

  end


  describe '.authenticate_with_credentials' do

    it "should return user info if valid" do
      expect(@user1.user_authenticate("aldwin@bautista.com", "12345")).to be_instance_of(User)
    end

    it "should return nil if info is invalid" do
      expect(@user1.user_authenticate("bob@bob.com", "12345")).not_to be_instance_of(User)
    end

    it "should return user info with whitespaces and case sensitivity" do
      expect(@user1.user_authenticate("  Aldwin@Bautista.com ", "12345")).to be_instance_of(User)
    end
  

  end


end
