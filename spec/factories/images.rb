FactoryGirl.define do
  factory :image do
    
    sequence :name do |i| 
    	"Bunny#{i}"
    end

    image { File.open(Rails.root.join('spec', 'fixtures', 'rabbit.jpg')) }
  
  end
end
