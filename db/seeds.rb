User.create([{id: 1, name: 'admin', email: 'admin@gmail.com', password: 'adminadmin', authority: true}])

Task.create([{task_name: 'admin', content: 'admin', status: '未着手', priority: '低', deadline: '2020-01-01', user_id: 1}])
