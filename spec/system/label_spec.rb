require 'rails_helper'
RSpec.describe 'ラベル機能', type: :system do
  before do
    FactoryBot.create(:user)
    visit new_session_path
    fill_in 'Email', with:'user_1@email.com'
    fill_in 'Password', with:'111111'
    click_button 'Log in'
  end
  describe 'ラベル機能の付与、表示、検索の確認' do
    before do
      FactoryBot.create(:label)
      FactoryBot.create(:second_label)
    end
    context 'タスクにラベルをつけて登録した場合' do
      it '作成したタスクの詳細画面にラベルが表示される' do
        visit new_task_path
        fill_in "タスク名", with: 'test_task'
        fill_in "詳しい内容", with: 'test_content'
        select '2021', from:'task_deadline_1i'
        select '10月', from:'task_deadline_2i'
        select '10', from:'task_deadline_3i'
        select '未着手', from:'task_status'
        select '低', from:'task_priority'
        check 'test_label_1'
        click_button "登録する"
        expect(page).to have_content 'test_label_1'
      end
    end

    context 'タスクを編集した場合' do
      before do
        FactoryBot.create(:task)
      end
      it '編集したタスクの詳細画面にラベルが表示される' do
        visit tasks_path
        click_on '編集'
        check 'test_label_1'
        click_button '登録する'
        expect(page).to have_content 'test_label_1'
      end
    end

    context "ラベル検索をした場合" do
      before do
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        visit tasks_path
        click_on '編集', match: :first
        check 'test_label_1'
        click_button '登録する'
      end
      it '検索したラベルの付いたタスクが表示される' do
        visit tasks_path
        select 'test_label_1', from: 'search[label_id]'
        click_button '検索'
        expect(page).to have_content 'test_task_name'
      end
    end
  end
end
