require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/contestants", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Contestant. As you add validations to Contestant, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Contestant.create! valid_attributes
      get contestants_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      contestant = Contestant.create! valid_attributes
      get contestant_url(contestant)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_contestant_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      contestant = Contestant.create! valid_attributes
      get edit_contestant_url(contestant)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Contestant" do
        expect {
          post contestants_url, params: { contestant: valid_attributes }
        }.to change(Contestant, :count).by(1)
      end

      it "redirects to the created contestant" do
        post contestants_url, params: { contestant: valid_attributes }
        expect(response).to redirect_to(contestant_url(Contestant.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Contestant" do
        expect {
          post contestants_url, params: { contestant: invalid_attributes }
        }.to change(Contestant, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post contestants_url, params: { contestant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested contestant" do
        contestant = Contestant.create! valid_attributes
        patch contestant_url(contestant), params: { contestant: new_attributes }
        contestant.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the contestant" do
        contestant = Contestant.create! valid_attributes
        patch contestant_url(contestant), params: { contestant: new_attributes }
        contestant.reload
        expect(response).to redirect_to(contestant_url(contestant))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        contestant = Contestant.create! valid_attributes
        patch contestant_url(contestant), params: { contestant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested contestant" do
      contestant = Contestant.create! valid_attributes
      expect {
        delete contestant_url(contestant)
      }.to change(Contestant, :count).by(-1)
    end

    it "redirects to the contestants list" do
      contestant = Contestant.create! valid_attributes
      delete contestant_url(contestant)
      expect(response).to redirect_to(contestants_url)
    end
  end
end