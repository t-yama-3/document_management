FactoryBot.define do
  factory :comment do
    body        {Faker::Job.field}
    user
    document
  end
end
