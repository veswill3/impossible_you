FactoryGirl.define do
  factory :user do
    sequence(:first) { |n| "Person #{n}" }
    sequence(:last)  { |n| "Lastname #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :goal do
    title "Lorem ipsum"
    user
  end
end