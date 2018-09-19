class Post < ApplicationRecord
  debugger
  validates :title, :content, presence:true
  validates :sub_ids, length: {minimum:1}
  
  has_many :comments
  has_many :postsubs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :postsubs, source: :sub 
  belongs_to :user
  
  
end


