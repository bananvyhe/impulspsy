require "rails_helper"

describe Article do 

	describe "#subject" do

		it "returns the article title" do
			#создаем обьект article
			article = create(:article, title: 'Lorem ipsum')
			#проверка
			expect(article.subject).to eq 'Lorem ipsum'
		end

	end

end