require 'rails_helper'

describe 'ポスト管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      FactoryBot.create(:task, title: '最初のポスト', content: '最初のコンテンツ')
      visit root_path
    end

    it 'ポスト一覧が表示される' do
      expect(page).to have_content '最初のポスト'
    end
  end
end
