require "rails_helper"

# frozen_string_literal: true

RSpec.describe Feedback,type: :model do
    it "is valid with a course_id, user_id and description" do
      user = User.create(name:"john", email: "jogn@gmail.com",password:"83267489")
      course=Course.create(name:"java",price:789,description:"2 lessons",image:"assets/img.png")
      feedback = Feedback.new(course_id:course.id, user_id:user.id, description:"Better than any coaching")
      expect(feedback).to be_valid
    end

    it "is not valid with a course_id " do
      feedback = Feedback.new(course_id:240)
      expect(feedback).to_not be_valid
    end

    describe 'Validations' do
      it { should validate_presence_of(:description) }
    end
end
