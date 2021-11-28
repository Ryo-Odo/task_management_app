require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'タスクモデル機能', type: :model do

    describe 'バリデーションのテスト' do
      context 'タスクのタイトルが空の場合' do
        it 'バリデーションにひっかる' do
          task = Task.new(task_name: '', content: '失敗テスト')
          expect(task).not_to be_valid
        end
      end
      context 'タスクの詳細が空の場合' do
        it 'バリデーションにひっかかる' do
          task = Task.new(task_name: '失敗テスト', content: '')
          expect(task).not_to be_valid
        end
      end
      context 'タスクのタイトルと詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
          task = Task.new(task_name: '合格テスト', content: '合格テスト')
          expect(task).to be_valid
        end
      end
    end
    describe '検索機能' do
      Task.destroy_all
      # 必要に応じて、テストデータの内容を変更して構わない
      let!(:test1) { FactoryBot.create(:task, task_name: 'x', status: '未着手') }
      let!(:test2) { FactoryBot.create(:second_task, task_name: 'z', status: '完了') }

      context 'scopeメソッドでタイトルのあいまい検索をした場合' do
        it "検索キーワードを含むタスクが絞り込まれる" do
          # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
          expect(Task.search_task_name('x')).to include(test1)
          expect(Task.search_task_name('x')).not_to include(test2)
          expect(Task.search_task_name('x').count).to eq 1
        end
      end
      context 'scopeメソッドでステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          # ここに内容を記載する
          expect(Task.search_status('未着手')).to include(test1)
          expect(Task.search_status('未着手')).not_to include(test2)
          expect(Task.search_status('未着手').count).to eq 1

        end
      end
      context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          # ここに内容を記載する
          expect(Task.search_task_name_status('x', '未着手')).to include(test1)
          expect(Task.search_task_name_status('x', '未着手')).not_to include(test2)
          expect(Task.search_task_name_status('x', '未着手').count).to eq 1
        end
      end
    end
  end
end
