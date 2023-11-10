require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  describe "UsersController#create" do
      context "User sign up" do
        it "renders the index template" do
          post :create, params:{email: "likhar@gmail.com", password: "avanika"}
          expect(response).to have_http_status(200)
        end

        it "renders the index template" do
          post :create
          expect(response).to have_http_status(422)
        end
      end
  end


  describe "UsersController#login" do
    context "User login" do
      it "login with fields" do
        user=User.create(email:"likhar@gmail.com",password: "avanika")
        post :login, params:{email: "likhar@gmail.com", password: "avanika"}
        expect(response).to have_http_status(200)
      end
      it "login without fields" do
        post :login
        expect(response).to have_http_status(401)
      end
    end
  end

end
