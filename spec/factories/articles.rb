FactoryBot.define do
  
  factory :article do
    title   {"title"}
    content {"content"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end
