
class ManagementController < ApplicationController
	def index

	end

	def boards
		@boards = Board.all
	end
	def users
		@users = User.all
	end

	def login
		if current_user
		if current_user.admin
			redirect_to :action => 'index'
		end
		end
	end
	def themes
      dir = 'public/themes/*'
      @dirs = Dir.glob(dir).select {|f| File.directory? f}
      @files = Dir.glob(dir).select {|f| File.file? (f)} 
      @theme_now = Settings.theme_path
	end
	def themeUpdate
		@theme = params[:theme]
		respond_to do |format|
			target  = Rails.root.join('config', 'config.yml')
			File.open(target, "w+") do |f|
  			f.write("defaults: &DEFAULTS
  theme_path: "+@theme+"
development:
  <<: *DEFAULTS

test:
  <<: *DEFAULTS

production:
  <<: *DEFAULTS")
  		format.html { redirect_to '/system-manage/themes/', notice: 'HUGE SUCCESS!' }
			end
		end
	end
end
class Settings < Settingslogic
  source Rails.root.join('config', 'config.yml')
  namespace Rails.env
end
