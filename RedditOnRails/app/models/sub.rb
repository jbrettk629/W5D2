class Sub < ApplicationRecord 
  
  validates :title, :description, presence:true
  
  has_many :postsubs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :postsubs, source: :post
  
  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: "User"
end 