FactoryBot.define do
  factory :profile do
    id            {0}
    introduction  {Faker::Job.field}
    prefecture    {2}
    user
  end
end
