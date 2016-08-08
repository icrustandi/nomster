class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  validates :message, :rating, presence:true
  after_create :send_comment_email
  RATINGS = {
    '✪✪✪✪✪'  => '5_stars',
    '✪✪✪✪'    => '4_stars',
    '✪✪✪'      => '3_stars',
    '✪✪'        => '2_stars',
    '✪'          => '1_star'
    
    
    

  }
  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
      NotificationMailer.comment_added(self).deliver
  end

end
