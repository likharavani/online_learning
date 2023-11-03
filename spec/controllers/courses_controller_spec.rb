require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:user) { User.create(name: "John Doe", email: "johndoe@example.com",password:"11111111")}
  let(:course) {Course.create(name:"java",price:678,description:"6 lessons",image:"assets/img.png")}
  let(:progress) {Progress.create(course_id:course.id,user_id:user.id,pdf_watched:0, percentage_completion:0.0,pdf_watched_history:"")}

  describe "CoursesController#index" do
    context "Courses are show" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end

  describe "CoursesController#show" do
    context "Courses are show with particular id " do
      it "renders the show template" do
        get :show, params: {id: 240}
        expect(response).to have_http_status("200")
      end
    end
  end

  describe "CoursesController#download_certificate" do
    context "course certificate download" do
      it "renders the show template" do
        sign_in(user)
        get :download_certificate
        expect(response).to have_http_status("200")
      end
    end
  end

  describe "CoursesController#add_course_to_user" do
    context "user can add course" do
      it "renders the course show template if user sign_in" do
        sign_in(user)
        get :add_course_to_user, params: { course_id: course.id}
        expect(response).to have_http_status("302")
      end

      it "renders the course show template if user not sign_in" do
        get :add_course_to_user, params: { course_id: course.id}
        expect(response).to have_http_status("200")
      end

    end
  end

  describe "CoursesController#update_user_progress" do
    context "update the user progress by clicking on particular pdf" do
      it "renders the show template" do

        patch :update_user_progress, params: { id: progress.id,link: "assets/img.jpg"}
        expect(response).to have_http_status("204")
      end
    end
  end

end
