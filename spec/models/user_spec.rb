require "rails_helper"

# frozen_string_literal: true

RSpec.describe User,type: :model do
    it "is valid with a name and an email" do
      user = User.new(name:"john", email: "jogn@gmail.com",password:"83267489")
      expect(user).to be_valid
    end
end
