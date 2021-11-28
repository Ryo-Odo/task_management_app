FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    task_name {'test_task_name'}
    content {'test_content'}
    deadline {'2022-12-22'}
    status {'未着手'}
    priority {'低'}
    user_id {1}
  end
  factory :second_task , class: Task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    task_name { 'test_task_name_2' }
    content { 'test_content_2' }
    deadline {'2021-11-11'}
    status {'完了'}
    priority {'高'}
    user_id {2}
  end
end
