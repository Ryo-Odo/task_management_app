User.create([{name: 'admin', email: 'admin@gmail.com', password: 'adminadmin', authority: true},
             {name: 'user2', email: '2@gmail.com', password: '1111111111', authority: false},
             {name: 'user3', email: '3@gmail.com', password: '1111111111', authority: false},
             {name: 'user4', email: '4@gmail.com', password: '1111111111', authority: false},
             {name: 'user5', email: '5@gmail.com', password: '1111111111', authority: false},
             {name: 'user6', email: '6@gmail.com', password: '1111111111', authority: false},
             {name: 'user7', email: '7@gmail.com', password: '1111111111', authority: false},
             {name: 'user8', email: '8@gmail.com', password: '1111111111', authority: false},
             {name: 'user9', email: '9@gmail.com', password: '1111111111', authority: false},
             {name: 'user10', email: '10@gmail.com', password: '1111111111', authority: false}])

Task.create([{task_name: 'admin', content: 'admin', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '2', content: '2', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '3', content: '3', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '4', content: '4', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '5', content: '5', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '6', content: '6', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '7', content: '7', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '8', content: '8', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '9', content: '9', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id},
             {task_name: '10', content: '10', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: User.first.id}])

Label.create([{label_name: 'test_label_1'},
              {label_name: 'test_label_2'},
              {label_name: 'test_label_3'},
              {label_name: 'test_label_4'},
              {label_name: 'test_label_5'},
              {label_name: 'test_label_6'},
              {label_name: 'test_label_7'},
              {label_name: 'test_label_8'},
              {label_name: 'test_label_9'},
              {label_name: 'test_label_10'}])
