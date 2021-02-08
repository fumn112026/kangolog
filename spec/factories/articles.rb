FactoryBot.define do
  
  factory :article do
    title   {"看護について"}
    content {"サンプルテキスト"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end
