FactoryGirl.define do
  factory :media_type do
    sequence :name do |i|
      "#{i}LazerDisk"  
    end

    trait :with_tracks do
      transient do
        track_count 3
      end

      after(:create) do |media_type, evaluator|
        create_list(:track, evaluator.track_count, media_type: media_type)
      end
    end
  end
end
