# By wrapping faker methods in a block, we ensure that faker generates dynamic data
# every time the factory is invoked. This way, we always have unique data\
FactoryBot.define do
    factory :todo do
        title { Faker::Lorem.word }
        created_by { Faker::Number.number(10) }
    end
end
