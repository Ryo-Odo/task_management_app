FactoryBot.define do
  factory :user do
    name { "user_1" }
    email { "user_1@email.com" }
    password_digest { "111111" }
    authority {false}
  end

  factory :second_user , class: User do
    name { "user_2" }
    email { "user_2@email.com" }
    password_digest { "222222" }
    authority {true}
  end
end
