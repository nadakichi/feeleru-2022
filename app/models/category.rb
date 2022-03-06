class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' }, { id: 2, category: '事務職' }, { id: 3, category: '販売職' },
    { id: 4, category: '専門的・技術的職' }, { id: 5, category: '生産工程職' }, { id: 6, category: 'サービス職' },
    { id: 7, category: '保安職' }, { id: 8, category: '建設・採掘職' }, { id: 9, category: '輸送・機械運転職' },
    { id: 10, category: '運搬・清掃・包装等職' }, { id: 11, category: '農林漁業職' }, { id: 12, category: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :businesses
end
