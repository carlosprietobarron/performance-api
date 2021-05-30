FactoryBot.define do
  factory :indicator do
    name {"indicator test"}
    goal { 20 }
    image { "some url" } 
    description { "some description" }
    
  end

end
