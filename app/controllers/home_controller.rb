class HomeController < ApplicationController
  def index
	@name = 'Grumpy Cat'
	@surname_1 = 'Aussi connu sous le nom de : Tardar Sauce'
	@surname_2 = 'Ou : Chat grincheux'
	@description = 'Célébrité du web ravageusement boudeuse, Mème interstelaire'
	@comment = 'Ce chat roxe du poney'
  end
end
