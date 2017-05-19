FactoryGirl.define do
  factory :genre do
    sequence :name do |i|
      "Folk#{i}"
    end

    trait :with_tracks do
      transient do
        track_count 3
      end

      after(:create) do |genre, evaluator|
        create_list(:track, evaluator.track_count, genre: genre)
      end
    end
  end
end
