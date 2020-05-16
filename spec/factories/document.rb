FactoryBot.define do
  factory :document do
    id          {0}
    title       {Faker::Job.title}
    note        {Faker::Job.field}
    src         {Faker::Internet.url}
    user
    section
  end
end
