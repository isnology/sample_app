# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User", email: "user@example.com") }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email is blank (not nil)" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  describe "when email format -" do
    it "is invalid" do
      %w[user@foo,com user_at_foo.org example.user@foo.
         foo@bar_baz.com foo@bar+baz.com].each do |invalid_address|
         @user.email = invalid_address
        should_not be_valid
      end
    end

    it "is valid" do
      %w[user@foo.com A_US-ER@f.b.org
         first.last@foo.jp a+b@baz.cn].each do |valid_address|
        @user.email = valid_address
        should be_valid
      end
    end
  end
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.downcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end
end
