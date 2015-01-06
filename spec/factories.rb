FactoryGirl.define do 
  
  factory :user, aliases: [:member] do 
    email"jerome@test.com"
    password "password"
  end

  factory :post do 
    caption "Having so much fun!"
  end
end
