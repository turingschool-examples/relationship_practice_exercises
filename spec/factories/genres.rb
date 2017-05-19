FactoryGirl.define do
  factory :genre do
    sequence :name do |i|
      "Folk#{i}"
    end
  end
end
