FactoryGirl.define do
  factory :user do
    sequence :username do |i|
      "username#{i}"
    end

    sequence :email do |i|
      "email#{i}@#{i}.com"
    end

    sequence :password_digest do |i|
      "password#{i}"
    end

    role 0
  end
end
