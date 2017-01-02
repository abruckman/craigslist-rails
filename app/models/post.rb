class Post < ApplicationRecord
  belongs_to :article
  validates :title, presence:true
  validates :body, presence:true
  validates :email, presence:true

end
