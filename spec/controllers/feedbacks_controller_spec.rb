require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  let(:user) { User.create(name: "John Doe", email: "johndoe@example.com",password:"11111111")}
  let(:course) {Course.create(name:"java",price:678,description:"6 lessons",image:"assets/img.png")}

  describe "FeedbacksController#index" do
    context "User can add feedback to course" do
      it "renders the show template" do
        sign_in(user)
        post  :create, params:{course_id: course.id, feedback: {description: "simple and easy course"}}
        expect(response).to have_http_status("302")
      end
    end
  end

  describe "FeedbacksController#new" do
    context "can initialize new feedback" do
      it "renders the show template" do
        post  :new
        expect(response).to have_http_status("200")
      end
    end
  end
end
