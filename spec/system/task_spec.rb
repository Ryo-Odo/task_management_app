require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        # 1. new_task_pathに遷移する（新規作成ページに遷移する）
        visit new_task_path
        # 2. 新規登録内容を入力する
        #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
        fill_in "タスク名", with: 'test_task'
        fill_in "内容", with: 'test_content'
        # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
        click_on "登録する"
        # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
        # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
        expect(page).to have_content 'test_task'
        expect(page).to have_content 'test_content'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # テストで使用するためのタスクを作成
        task = FactoryBot.create(:task)
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content 'test_task_name'
        # expectの結果が true ならテスト成功、false なら失敗として結果が
      end
    end
    # テスト内容を追加で記載する
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        # ここに実装する\
        task = FactoryBot.create(:task)
        sleep 2
        task = FactoryBot.create(:second_task)
        visit tasks_path
        task_list_1 = all('tr')[1].all('td')
        task_list_2 = all('tr')[2].all('td')

        expect(task_list_1[0]).to have_content 'test_task_name_2'
        expect(task_list_1[1]).to have_content 'test_content_2'
        expect(task_list_2[0]).to have_content 'test_task_name'
        expect(task_list_2[1]).to have_content 'test_content'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task)
        visit task_path(task.id)
        expect(page).to have_content 'test_task_name'
        expect(page).to have_content 'test_content'
      end
    end
  end
end
