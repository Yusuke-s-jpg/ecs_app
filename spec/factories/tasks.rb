FactoryBot.define do
  factory :task do
    title { 'テスト' }
    content { 'これはテストです' }
    user_id { 1 }
  end
end
