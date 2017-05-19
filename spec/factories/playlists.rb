FactoryGirl.define do
  factory :playlist do
    sequence :name do |i| 
      "#{i}Jamz"
    end
  end
end

