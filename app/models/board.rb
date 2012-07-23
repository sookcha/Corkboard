class Board < ActiveRecord::Base
  attr_accessible :content, :name, :title, :board_id,:board
  has_many :posts
end