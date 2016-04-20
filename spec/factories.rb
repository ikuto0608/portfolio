FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "first_#{n}" }
    sequence(:last_name) {|n| "last_#{n}" }
    sequence(:full_name) {|n| "first_#{n}.last_#{n}"}
    sequence(:email) {|n| "hoge_#{n}@hoge.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end

  factory :experience do
    name "exp"
    year 1
    language "Ruby"

    user
  end

  factory :product do
    name "pro"
    about "something"
    based_on "Rails"
    url "sample.com"
    degree 2

    user
  end

  factory :skill do
    name "ski"
    degree 1
    type "Skill::Hobby"

    user
  end

  factory :sns do
    url "sample.com"
    kind 2

    user
  end
end
