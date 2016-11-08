class EmployeesController < ApplicationController
	
	def index
		@mark = 4
		@employee = Employee.all
	end

	def new
		@mark = 4
		 @employee = Employee.new
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def create
		@employee = Employee.new(employee_params)
		
		if @employee.valid?
			 
			@employee.save
		else
			render action: 'new'
		end
	end

	private	
		def employee_params
			params.require(:employee).permit(:avatar, :avatar_cache, :prof, :name, :spec, :education, :addeducation, :programms)
		end
end
