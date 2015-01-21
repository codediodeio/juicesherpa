require 'rails_helper'

describe Recipe, :type => :model do


   context "when Recipe name is blank" do
     let(:recipe) { Recipe.new(name: "") }

     it "should not be valid" do
        expect(recipe.valid?).to be_falsey
      end

   end


   context "when recipe name is too short" do
   end

   context "when Recipe description is too long" do
   end

   context "when recipe name does not have a user_id" do
   end

end
