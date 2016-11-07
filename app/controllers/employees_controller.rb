class EmployeesController < ApplicationController
	
	def index
		@mark = 4
		@employee = Employee.all
	end

	def new
		@mark = 4
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def create
		@employee = employee.new(employee_params)
		if @employee.valid?
			@employee.save
		else
			render action: 'new'
		end
	end

	private	
		def employee_params
			params.require(:employee).permit(:email, :message)
		end
end
