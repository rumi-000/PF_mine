#会員側の登録情報
Admin.create!(
    email: 'test@test.com',
    password: '12345678',
)

 Tag.create!(
  [
    {name: '誰でも', description: 'どなたでもご利用できます。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/people-tag.png"), filename:"people-tag.png")},
    {name: '赤ちゃん', description: '小さなお子様のいる家庭でご利用しやすいです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/baby-tag.png"), filename:"baby-tag.png")},
    {name: 'ペット', description: '大事なペットのために備える防災グッズです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pet-tag.png"), filename:"pet-tag.png")},
    {name: '高齢者', description: '特にご高齢の方がいらっしゃる家庭でご利用ください。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/oldp-tag.png"), filename:"oldp-tag.png")},
  ]
)

User.create!(
  [
    {email: 'sato@example.com', name: '佐藤', password: 'password', introduction: 'こんにちは！ペットのための防災グッズを探しています。'},
    {email: 'suzuki@example.com', name: '鈴木', password: 'password', introduction: '高齢者がいるので、実際に使用したグッズレビューを投稿しています。'},
    {email: 'takahashi@example.com', name: '高橋', password: 'password', introduction: '赤ちゃんのための防災グッズを探しています。'},
    {email: 'yoshida@example.com', name: '吉田', password: 'password', introduction: 'このサイトで防災グッズをたくさん知れれば嬉しいです。'},
    {email: 'tachibanaa@example.com', name: '橘', password: 'password', introduction: '皆さんの投稿を見るためにアカウントを作成しました。'},
  ]
)

