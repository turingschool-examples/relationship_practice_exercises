FactoryGirl.define do
  factory :artist do
    sequence :name do |i|
      "#{i}The Avett Brothers"  
    end

    trait :with_albums do
      transient do
        album_count 3
      end

      after(:create) do |artist, evaluator|
        create_list(:album, evaluator.album_count, artist: artist)
      end
    end
  end
end
