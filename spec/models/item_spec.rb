require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の新規登録' do
    before do
      @item = FactoryBot.create(:item)
      sleep(0.5)
    end

    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存ができること' do
        expect(@item).to be_valid
      end

      it '金額は空でも登録ができる' do
        @item.price = ""
        expect(@item).to be_valid
      end

      it '商品説明は空でも登録ができる' do
        @item.explanation = ""
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '商品名が空では登録ができない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品画像が未登録では登録ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")        
      end

      it '金額に半角数値以外の値が入っている場合登録ができない' do
        @item.price = "10,000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")

      end

      it '金額に10000を超える値が入っている場合登録ができない' do
        @item.price = "30000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
        
      end

      it 'ユーザーが紐づいていない場合登録ができない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")        
      end
    end
  end
end