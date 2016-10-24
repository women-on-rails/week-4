class HomeController < ApplicationController
  def index
	# Variable d'instance contenant un tableau de curiosités
	@my_curiosities = Curiosity.all
  end
end
