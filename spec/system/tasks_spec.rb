require 'rails_helper'

describe 'タスク管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:task_a) { FactoryBot.create(:task, title: 'タスクA', user: user_a) }

  describe '一覧表示機能' do
    before do
      visit root_path
    end

    it 'タスク一覧が表示される' do
      expect(page).to have_content 'タスクA'
    end
  end

  describe '詳細表示機能' do
    before do
      visit task_path(task_a)
    end

    it 'タスク詳細が表示される' do
      expect(page).to have_content 'タスクA'
    end
  end
end
