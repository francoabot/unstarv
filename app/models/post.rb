class Post < ActiveRecord::Base
  include PublicActivity::Model
   tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :groupost
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :body, presence: true, length: { minimum:40 }
  validate  :picture_size
   
   has_reputation :votes, source: :user, aggregated_by: :sum
    
  
   # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end






  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end



end
