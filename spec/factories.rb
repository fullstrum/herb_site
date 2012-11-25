FactoryGirl.define do
  factory :user do
    firstName     "Michael"
    lastName	"Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end