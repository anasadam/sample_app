require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  describe "account_activation_test" do
    it "account_activation" do
      user = users(:michael)
      user.activation_token = User.new_token
      mail = UserMailer.account_activation(user)
      assert_equal "Account activation", mail.subject
      assert_equal [user.email], mail.to
      assert_equal ["noreply@example.com"], mail.from
      assert_match user.name,               mail.body.encoded
      assert_match user.activation_token,   mail.body.encoded
      assert_match CGI.escape(user.email),  mail.body.encoded
    end
    it "password_reset" do
      mail = UserMailer.password_reset
      assert_equal "Password reset", mail.subject
      assert_equal ["to@example.org"], mail.to
      assert_equal ["from@example.com"], mail.from
      assert_match "Hi", mail.body.encoded
    end
  end 

  describe "account_activation" do
    let(:mail) { UserMailer.account_activation }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "password_reset" do
    let(:mail) { UserMailer.password_reset }

    it "renders the headers" do
      expect(mail.subject).to eq("Password reset")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end

    it "password_reset" do
      user = users(:michael)
      user.reset_token = User.new_token
      mail = UserMailer.password_reset(user)
      assert_equal "Password reset", mail.subject
      assert_equal [user.email], mail.to
      assert_equal ["noreply@example.com"], mail.from
      assert_match user.reset_token,        mail.body.encoded
      assert_match CGI.escape(user.email),  mail.body.encoded
      end
  end

end
