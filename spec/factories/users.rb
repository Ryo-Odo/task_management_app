FactoryBot.define do
  factory :user do
    id {1}
    name { "user_1" }
    email { "user_1@email.com" }
    password { '111111' }
    authority {false}
  end

  factory :second_user , class: User do
    id {2}
    name { "user_2" }
    email { "user_2@email.com" }
    password { '222222' }
    authority {true}
  end
end
