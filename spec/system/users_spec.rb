require 'rails_helper'

describe 'ユーザー管理機能' do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let!(:task_a) { FactoryBot.create(:task, title: 'タスクA', user: user_a) }

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログイン'
  end

  describe 'ユーザープロフィール表示機能'
    before do
      visit user_path(user_a)
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザーAのプロフィールが表示される' do
        expect(page).to have_content 'ユーザーA'
      end

      it 'ユーザーAのタスク一覧が表示される' do
        expect(page).to have_content 'タスクA'
      end
    end
  end
