class HomeController < ApplicationController
  def index
	@name = 'Grumpy Cat'
	@surname_1 = 'Aussi connu sous le nom de : Tardar Sauce'
	@surname_2 = 'Ou : Chat grincheux'
	@description = 'Célébrité du web ravageusement boudeuse, Mème interstelaire'
	@comment = 'Ce chat roxe du poney'

	# variable d'instance contenant un tableau de textes
	@curiosities = [
		'pelote de laine',
		'tapis de souris',
		'herbe à chat',
		'arbre à gratter',
		'oreilles de lapin',
		'peluche dinosaure']

	# Variable d'instance contenant un tableau de curiosités
	@my_curiosities = Curiosity.all
  end
end
