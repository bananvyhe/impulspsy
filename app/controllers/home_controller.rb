class HomeController < ApplicationController
  def index
  	@mark = 1
	 @sliders = Slider.order(:number) 

  end
end
