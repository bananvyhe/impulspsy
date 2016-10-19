require "rails_helper"

describe Contact do 

	it { should validate_presence_of (:email) }
end


#describe "something" do
#	it "does something" do
#	end
#end