require "rails_helper"

# frozen_string_literal: true

RSpec.describe Pdf,type: :model do
    it "is valid with a name,path and course id" do
      course=Course.create(name:"java",price:789,description:"2 lessons",image:"assets/img.png")
      pdf = Pdf.new(name:"abc",path:"assets/p.pdf",course_id:course.id)
      expect(pdf).to be_valid
    end

    it "is not valid with a course_id " do
      feedback = Feedback.new(course_id:240)
      expect(feedback).to_not be_valid
    end
end
