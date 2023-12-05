class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'メンズ' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'ベビー' },
    { id: 4, name: 'キッズ' },
    { id: 5, name: 'インテリア' },
    { id: 6, name: '住まい' },
    { id: 7, name: '小物' },
    { id: 8, name: '本' },
    { id: 9, name: '音楽' },
    { id: 10, name: 'ゲーム' },
    { id: 11, name: 'おもちゃ・ホビー・グッズ' },
    { id: 12, name: '家電・スマホ・カメラ' },
    { id: 13, name: 'スポーツ・レジャー' },
    { id: 14, name: 'ハンドメイド' },
    { id: 15, name: 'その他' }
  ]
  
  include ActiveHash::Associations
  has_many :items
end
