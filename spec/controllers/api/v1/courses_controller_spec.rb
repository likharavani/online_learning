require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do
  let(:user) { User.create(name: "John Doe", email: "johndoe@example.com",password:"11111111")}
  let(:course) {Course.create(name:"java",price:678,description:"6 lessons",image:"assets/img.png")}
  let(:progress) {Progress.create(course_id:course.id,user_id:user.id,pdf_watched:0, percentage_completion:0.0,pdf_watched_history:"")}

  describe "CoursesController#index" do
    context "Courses are show" do
      it "user can access courses with login" do
        request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
        get :index
        expect(response).to have_http_status(:ok)
      end

      it "user can access courses without login" do
        get :index
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "CoursesController#show" do
    context "Courses are show with particular id " do
      it "renders the show template" do
        request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
        get :show, params: {id: 240}
        expect(response).to have_http_status("200")
      end
    end
  end

  describe "CoursesController#create" do
    context "Course creation" do
      it "user can create course " do
        request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
        post :create,params: {name:"coding coures",description:"9 lessons", price:7899, image:"img.png"}
        expect(response).to have_http_status(201)
      end

      it "user can create course" do
        request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
        post :create
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "CoursesController#download_certificate" do
    context "course certificate download" do
      it "renders the show template" do
        request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
        get :download_certificate
        expect(response).to have_http_status("200")
      end
    end
  end

  describe "CoursesController#add_course_to_user" do
    context "user can add course" do
      it "renders the course show template if user sign_in" do
        request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
        get :add_course_to_user, params: { course_id: course.id}
        expect(response).to have_http_status("302")
      end

      it "renders the course show template if user not sign_in" do
        user=nil
        get :add_course_to_user, params: { course_id: course.id}
        expect(response).to have_http_status("401")
      end
    end
  end

  # describe "CoursesController#update_user_progress" do
  #   context "update the user progress by clicking on particular pdf" do
  #     it "renders the show template" do
  #       request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
  #       get :update_user_progress, params: { id: progress.id,link: "assets/img.jpg"}
  #       expect(response).to have_http_status("401")
  #     end
  #   end
  # end     


  # describe "CoursesController#update" do
  #   context "Course update" do
  #     it "course update" do
  #       request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
  #       patch :update, params: {name:"coding coures1"}
  #       expect(response).to have_http_status(200)
  #     end

  #     it "course update" do
  #       request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
  #       patch :update
  #       expect(response).to have_http_status(422)
  #     end
  #   end
  # end

  describe "CoursesController#destroy" do
    context "Course delete" do
      it "course update" do
        request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
        delete :destroy, params: {id: course.id}
        expect(response).to have_http_status(204)
      end
    end
  end
end
