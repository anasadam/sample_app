require 'rails_helper'

RSpec.describe User, type: :model do

  subject {User.new(name:"Iman", email:'iman@gymleads.com')}

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
    subject.name = 'n' * 50
    expect(subject).to be_valid
  end 

  it "email shouldn't be too long and should be a valid email" do
    subject.email = 'e@gmail.com' 
    expect(subject).to be_valid
  end 

end
