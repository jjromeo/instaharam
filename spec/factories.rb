FactoryGirl.define do 
  
  factory :user, aliases: [:member] do 
    email"jerome@test.com"
    password "password"
  end

  factory :post do 
    caption "Having so much fun!"
  end

  factory :comment do 
    association :post
    text "This is a real #hashtag"
  end

  factory :hashtag do 
    content "#hashtag"
    href "/hashtags/hashtag"
  end

end
