FactoryGirl.define do
  factory :user do
    name     "Glenn Marks"
    email    "glenn@isnology.com"
    password "foobar"
    password_confirmation "foobar"
  end
end