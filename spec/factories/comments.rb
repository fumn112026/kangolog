FactoryBot.define do

  factory :comment do
    text              {"testtext"}
    association :user
    association :article
  end

end
