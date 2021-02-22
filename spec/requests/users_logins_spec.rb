require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do

  fixtures :users

  describe "GET /login" do
    it "works! (now write some real specs)" do
      get login_path
      expect(response).to have_http_status(200)
    end

    #to test that flash message appears only one time after unsuccessful login 
    it "login with invalid information "do 
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert flash
    get root_path
    assert flash.empty?
    end 

  
    it "login with valid information" do
      @user = users(:adam)
      get login_path
      post login_path, params: { session: { email: @user.email,
                                            password: '123456' } }
      assert_redirected_to @user
      follow_redirect!
      assert_template 'users/show'
      assert_select "a[href=?]", login_path, count: 0
      assert_select "a[href=?]", logout_path
      assert_select "a[href=?]", user_path(@user)
    end

    it "login with valid information followed by logout" do
      get login_path
      post login_path, params: { session: { email:    @user.email,
                                            password: 'password' } }
      assert is_logged_in?
      assert_redirected_to @user
      follow_redirect!
      assert_template 'users/show'
      assert_select "a[href=?]", login_path, count: 0
      assert_select "a[href=?]", logout_path
      assert_select "a[href=?]", user_path(@user)
      delete logout_path
      assert_not is_logged_in?
      assert_redirected_to root_url
      # Simulate a user clicking logout in a second window.
      delete logout_path
      follow_redirect!
      assert_select "a[href=?]", login_path
      assert_select "a[href=?]", logout_path,      count: 0
      assert_select "a[href=?]", user_path(@user), count: 0
   end

  end
  
  
end
