class Post < ActiveRecord::Base
  belongs_to :board

  attr_accessible :author, :body,:board,:board_id,:title
  has_many :comments, :dependent => :destroy
end