require 'rails_helper'

RSpec.describe "UsersEdits", type: :request do

  #load testing data - Users fixtuers 
  fixtures :users

  describe "GET /edit_user_path" do
    it "works! (now write some real specs)" do
      @user = users(:iman)
      log_in_as(users(:iman))
      get edit_user_path(@user)
      expect(response).to have_http_status(200)
    end

    #simulate successful edit/update
    it "successful edit" do
      @user = users(:iman)
      log_in_as(@user)
      get edit_user_path(@user)
      assert_template 'users/edit'
      name = "Iman 2"
      email = "foo@bar.com"
      patch user_path(@user), params: { user: { name: name,
                                                email: email,
                                                password: "",
                                                password_confirmation: "" } }
      expect(flash.empty?).to be false
      assert_redirected_to @user
      @user.reload
      assert_equal name, @user.name
      assert_equal email, @user.email
    end

    it "successful edit with friendly forwarding" do
      @user = users(:iman)
      get edit_user_path(@user)
      log_in_as(@user)
      assert_redirected_to edit_user_path(@user)
      name = "Foo Bar"
      email = "foo@bar.com"
      patch user_path(@user), params: { user: { name: name,
                                                email: email,
                                                password:              "",
                                                password_confirmation: "" } }
      assert_not flash.empty?
      assert_redirected_to @user
      @user.reload
      assert_equal name,  @user.name
      assert_equal email, @user.email
    end

  end
end
