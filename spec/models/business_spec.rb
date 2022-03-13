require 'rails_helper'

RSpec.describe Business, type: :model do
  before do
    @business = FactoryBot.build(:business)
  end

  describe '掲載機能' do
    context '掲載できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@business).to be_valid
      end
    end
    context '掲載できないとき' do
      it '画像必須' do
        @business.image = nil
        @business.valid?
        expect(@business.errors.full_messages).to include("Image can't be blank")
      end
      it '会社名必須' do
        @business.company = ''
        @business.valid?
        expect(@business.errors.full_messages).to include("Company can't be blank")
      end
      it '体験名必須' do
        @business.name = ''
        @business.valid?
        expect(@business.errors.full_messages).to include("Name can't be blank")
      end
      it '説明必須' do
        @business.text = ''
        @business.valid?
        expect(@business.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリー必須' do
        @business.category_id = ''
        @business.valid?
        expect(@business.errors.full_messages).to include("Category can't be blank")
      end
      it '体験元情報必須' do
        @business.prefecture_id = ''
        @business.valid?
        expect(@business.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '体験元情報のカラムはId1では登録できない' do
        @business.prefecture_id = 1
        @business.valid?
        expect(@business.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '価格情報必須' do
        @business.price = ''
        @business.valid?
        expect(@business.errors.full_messages).to include("Price can't be blank")
      end
      it '価格300未満の時保存できない' do
        @business.price = 299
        @business.valid?
        expect(@business.errors.full_messages).to include("Price can't be blank")
      end
      it '価格10000000以上の時保存できない' do
        @business.price = 10_000_000
        @business.valid?
        expect(@business.errors.full_messages).to include("Price can't be blank")
      end
      it '金額は半角数値以外では登録できないこと' do
        @business.price = '１００'
        @business.valid?
        expect(@business.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
