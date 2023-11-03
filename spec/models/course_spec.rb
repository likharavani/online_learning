require "rails_helper"

# frozen_string_literal: true

RSpec.describe Course,type: :model do
    it "is valid with a name ,price,description and image" do
      course = Course.new(name:"java for begineers", price:5879, description:"6 lessons", image: "assets/images/bg.jpg")
      expect(course).to be_valid
    end
    it "is not valid with a name and image" do
      course = Course.new(name:"java for begineers",image: "assets/images/bg.jpg")
      expect(course).to_not be_valid
    end
    it "is not valid with only name" do
      course = Course.new(name:"java for begineers")
      expect(course).to_not be_valid
    end
    it "is not valid with only image" do
      course = Course.new(image: "assets/images/bg.jpg")
      expect(course).to_not be_valid
    end
    it "is not valid with only description" do
      course = Course.new(name:"begineer friendle course ")
      expect(course).to_not be_valid
    end
    it "is not valid with only price" do
      course = Course.new(price:6788)
      expect(course).to_not be_valid
    end
end
