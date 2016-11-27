class SlidersController < ApplicationController
	def index
		
		@sliders = Slider.order(:number) 


	end

	def new
		
		 @slider = Slider.new
	end

	def show
		@slider = Slider.find(params[:id])

	end

	def create
		@sliders = Slider.all
		@slider = Slider.new(slider_params)
		
		if @slider.valid?
			@slider.save

		else
			render action: 'new'
		end
	end

	def edit
		@slider = Slider.find(params[:id])

  	end

  	def update
		@slider = Slider.find(params[:id])
		if @slider.update(slider_params)
        redirect_to @slider
        else
          render action: 'edit'
    	end
  	end

  	def destroy
  		@slider = Slider.find(params[:id])
  		@slider.remove_slide!
  		@slider.save
		@slider.destroy
		redirect_to action: :index
  	end

	private	
		def slider_params
			params.require(:slider).permit(:slide, :number, :title, :descriprion)
		end
end
