User.create([{id: 1, name: 'admin', email: 'admin@gmail.com', password: 'adminadmin', authority: true}])
Task.create([{task_name: 'admin', content: 'admin', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: 1}])
Label.create([{label_name: 'test_label_1'},
              {label_name: 'test_label_2'},
              {label_name: 'test_label_3'},
              {label_name: 'test_label_4'},
              {label_name: 'test_label_5'}])
Labelling.create([{task_id: Task.first.id, label_id: Label.first.id},
                 {task_id: Task.first.id, label_id: Label.last.id}])
