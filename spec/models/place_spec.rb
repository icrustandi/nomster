require 'rails_helper'

RSpec.describe Place, type: :model do

  it "should delete its comments when deleted" do
    @user = User.create!(email: "test@test.com", password: "password")
    @place = Place.create!(user: @user, name: "pizza", address: "something st", description: "test desc") 
    @rating = "2_stars"
    @message= "test message"
    @comment = Comment.create!(place: @place, rating: @rating, message: @message)
    
    # When i call place.destroy the comment is also destroyed
    # expect{ @place.destroy }.to change(Comment, :count).by(-1)
    expect(Comment.where(id: @comment.id)).to_not be_empty
    expect(Comment.count).to eq 1
    @place.destroy
    expect(Comment.where(id: @comment.id)).to be_empty
    expect(Comment.count).to eq 0
  
  end
end
