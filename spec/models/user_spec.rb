require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { build(:user) }

  it "creates a valid user" do
    expect(user).to be_valid
  
  end

  it "must have a name present" do
    user.name=""
    expect(user).not_to be_valid
  end

  it "must have an email present" do
    user.name="carlos"
    user.email=""
    expect(user).not_to be_valid
  end

  it "must have a password present" do
    user.name="carlos"
    user.email="carlos@gmail.com"
    user.password_digest=""
    expect(user).not_to be_valid
  end
end
