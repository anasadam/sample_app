require 'rails_helper'

RSpec.describe User, type: :model do

  subject {User.new(name:"Iman", email:'iman@gymleads.com',password:'123456')}

  #check fot email is not empty 
  it "is not valid when email is empty" do 
    subject.email="iman@gymleads.com"
    expect(subject).to be_valid 
  end 

  #check for name isn't empty 
  it "is not valid when name is empty" do
    subject.name="iman"
    expect(subject).to be_valid
  end

  it "name should not be too long" do 
    subject.name = 'n' * 5
    expect(subject).to be_valid
  end 

  it "email shouldn't be too long and should be a valid email" do
    subject.email = 'e@gmail.com' 
    expect(subject).to be_valid
  end 

  it "authenticated? should return false for a user with nil digest" do

    expect(subject.authenticated?('')).to be false
 end

end
