class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         validates :name, presence: true #追記
         validates :profile, length: { maximum: 200 } 
         def already_liked?(post)
          self.likes.exists?(post_id: post.id)
        end
  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy    
end
