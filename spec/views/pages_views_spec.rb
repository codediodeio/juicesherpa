require "rails_helper"

describe "pages/home", :type => :view do

  let(:home_page) { visit "/" }

  it "renders the home template" do
    render
    expect(view).to render_template(:home)
  end

  it "it contains JuiceSherpa in the Title" do
    home_page
    expect(page).to have_title "JuiceSherpa"
  end

end

  describe "pages/about", :type => :view do

    let(:about_page) { visit "pages/about" }

    it "should have 'Our Story' in the title" do
      about_page
      expect(page).to have_title "Our Story"
    end

  end
