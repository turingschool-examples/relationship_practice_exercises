FactoryGirl.define do
  factory :track do
    name "Jam"
    milliseconds 10
    genre
    album
    media_type

    trait :with_playlists do
      transient do
        playlist_count 2
      end

      after(:create) do |track, evaluator|
        track.playlists << create_list(:playlist, evaluator.playlist_count)
      end
    end
  end
end

