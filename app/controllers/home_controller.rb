class HomeController < ApplicationController
  def index
  	@mark = 1
	@sliders = Slider.all
  end
end
