FactoryGirl.define do
  factory :album do
    sequence :title do |i|
      "Mignonette#{i}"
    end
    artist
  end
end
