require 'rails_helper'

RSpec.describe "Users", type: :request do

    it "should redirect edit when logged in as wrong user" do
        log_in_as(@other_user)
        get edit_user_path(@user)
        assert flash.empty?
        assert_redirected_to root_url
      end
    
      it "should redirect update when logged in as wrong user" do
        log_in_as(@other_user)
        patch user_path(@user), params: { user: { name: @user.name,
                                                  email: @user.email } }
        assert flash.empty?
        assert_redirected_to root_url
      end
    
      it "successful edit with friendly forwarding" do
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
