FactoryBot.define do
  factory :section do
    id           {0}
    section_name {Faker::Job.title}
    gist         {Faker::String.random(length: 3..12)}
    disclosure   {0}
    user
  end
end
