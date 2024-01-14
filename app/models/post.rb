class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
    mount_uploader :image, ImageUploader
    has_many :post_tag_relations, dependent: :destroy
    has_many :tags, through: :post_tag_relations, dependent: :destroy
end
