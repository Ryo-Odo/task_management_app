FactoryBot.define do
  factory :label do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    id {1}
    label_name { "test_label_1" }
  end
  factory :second_label , class: Label do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    id {2}
    label_name { "test_label_2" }
  end
end
