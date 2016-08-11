class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, too_short: "%{count} characters is the minimum allowed" }
  validates :address, :description, presence:true
  
  geocoded_by :address
  after_validation :geocode


end
