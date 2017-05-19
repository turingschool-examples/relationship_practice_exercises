FactoryGirl.define do
  factory :playlist do
    sequence :name do |i| 
      "#{i}Jamz"
    end

    trait :with_tracks do
      transient do
        track_count 2
      end

      after(:create) do |playlist, evaluator|
        playlist.tracks << create_list(:track, evaluator.track_count)
      end
    end
  end
end

