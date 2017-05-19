FactoryGirl.define do
  factory :media_type do
    sequence :name do |i|
      "#{i}LazerDisk"  
    end
  end
end
