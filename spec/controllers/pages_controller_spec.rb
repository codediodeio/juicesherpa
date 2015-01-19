require "rails_helper"

describe PagesController, :type => :controller do

  describe "GET #home" do

    let(:home) { get :home }

    it "should respond with 200 status code" do
      home
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render the home template" do
      home
      expect(response).to render_template("home")
    end

  end

  describe "GET #about" do

    let(:about) { get :about }

    it "should respond with 200 status code" do
      about
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render the about template" do
      about
      expect(response).to render_template("about")
    end

  end

end
