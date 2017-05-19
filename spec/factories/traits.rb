FactoryGirl.define do
  trait :with_tracks do
    transient do
      track_count 3
    end

    after(:create) do |object, evaluator|
      object.tracks << create_list(:track, evaluator.track_count)
    end
  end
end

