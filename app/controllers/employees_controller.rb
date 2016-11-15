class EmployeesController < ApplicationController
	
	def index
		@mark = 4
		@employees = Employee.all

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
			 spliter = @employee.name
			  
			s1 = spliter.split(/ /)
			first = s1[0]
			second = s1[1]
			third = s1[2]

			@employee.first =  first.mb_chars.capitalize.to_s
			@employee.second =  second.mb_chars.capitalize.to_s
			@employee.third =  third.mb_chars.capitalize.to_s

			@employee.save

		else
			render action: 'new'
		end
	end

	def edit
		@employee = Employee.find(params[:id])

  	end

  	def update
		@employee = Employee.find(params[:id])
		if @employee.update(employee_params)
        redirect_to @employee
        else
          render action: 'edit'
    	end
  	end

  	def destroy
  		@employee = Employee.find(params[:id])
  		@employee.remove_avatar!
  		@employee.save
		@employee.destroy
		redirect_to action: :index
  	end

	private	
		def employee_params
			params.require(:employee).permit(:avatar, :avatar_cache, :prof, :name, :spec, :education, :addeducation, :programms)
		end
end
