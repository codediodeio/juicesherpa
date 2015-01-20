require 'rails_helper'

RSpec.describe "recipes/new", :type => :view do
  before(:each) do
    assign(:recipe, Recipe.new(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders new recipe form" do
    render

    assert_select "form[action=?][method=?]", recipes_path, "post" do

      assert_select "input#recipe_name[name=?]", "recipe[name]"

      assert_select "input#recipe_user_id[name=?]", "recipe[user_id]"
    end
  end
end
