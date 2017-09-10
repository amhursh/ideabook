FactoryGirl.define do
  factory :idea do
    
    sequence :title do |i|
    	"ideatitle#{i}"
    end

    sequence :body do |i| 
    	"description#{i}"
    end

    user

    category
  end
end
