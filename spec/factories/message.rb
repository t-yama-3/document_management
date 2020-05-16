FactoryBot.define do
  factory :message do
    id          {0}
    title       {Faker::Job.title}
    text        {Faker::Job.field}
    friend
    user
    receiver
  end
end
