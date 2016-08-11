require 'rails_helper'

RSpec.describe Place, type: :model do

  it "should delete its comments when deleted" do
    @place = Place.create
    @comment = Comment.create(place: @place)
    # When i call place.destroy the comment is also destroyed
    # expect{ @place.destroy }.to change(Comment, :count).by(-1)
    
    @place.destroy
    expect(Comment.where(id: @comment.id)).to be_empty
  
  end
end
