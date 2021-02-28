require 'rails_helper'

RSpec.describe "UsersIndices", type: :request do

  fixtures :users

  describe "GET /users" do
  
    it "works! (now write some real specs)" do
      @user = users(:iman)
      log_in_as(@user)
      get users_path
      expect(response).to have_http_status(200)
    end

    it "index including pagination??" do
      @user = users(:iman)
      log_in_as(@user)
      get users_path
      assert_template 'users/index'
      assert_select 'div.pagination'
      #User.paginate(page: 1).each do |user|
      #  assert_select 'a[href=?]', user_path(user), text: user.name
      #end
    end

    it  "index as admin including pagination and delete links" do
     @admin = users(:iman)
      log_in_as(@admin)
      get users_path
      assert_template 'users/index'
      assert_select 'div.pagination'
      first_page_of_users = User.paginate(page: 1)
      first_page_of_users.each do |user|
      #  assert_select 'a[href=?]', user_path(user), text: user.name
      #  unless user == @admin
      #    assert_select 'a[href=?]', user_path(user), text: 'delete'
      #  end
    end
    #assert_difference 'User.count', -1 do
    #  delete user_path(@non_admin)
    #end
  end

    it "index as non-admin" do
      @non_admin = users(:adam)
      log_in_as(@non_admin)
      get users_path
      assert_select 'a', text: 'delete', count: 0
    end

  end
end
