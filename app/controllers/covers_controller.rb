
class CoversController < ApplicationController

  def index
  	@boards = Board.all
  	@posts = Post.order("created_at DESC").all
  end
end
