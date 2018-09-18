class Post < ApplicationRecord
  
  validates :title, :content, presence:true
  
  has_many :postsubs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :postsubs, source: :sub 
  belongs_to :user
  
  
end


