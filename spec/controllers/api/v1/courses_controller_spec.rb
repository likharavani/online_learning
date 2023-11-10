require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do
  # let(:user) { User.create(name: "John Doe", email: "johndoe@example.com",password:"11111111")}
  # let(:course) {Course.create(name:"java",price:678,description:"6 lessons",image:"assets/img.png")}
  # let(:progress) {Progress.create(course_id:course.id,user_id:user.id,pdf_watched:0, percentage_completion:0.0,pdf_watched_history:"")}

  describe "CoursesController#index" do
    context "Courses are show" do
      it "renders the index template" do
        get :index
        expect(response).to have_http_status(200)
      end

      it "user can access courses without login" do
        get :index
        expect(response).to have_http_status(401)
      end
    end
  end
end
