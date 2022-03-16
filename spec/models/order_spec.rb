require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '注文の新規登録' do
    before do
      @order = FactoryBot.create(:order)
      sleep(0.5)
    end

    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存することができる' do
        expect(@order).to be_valid
      end

      it 'order_commentは空でも保存することができる' do
        @order.order_comment = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'order_dateは空では登録が出来ない' do
        @order.order_date = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('Order dateを入力してください')
      end

      it 'order_status_idは空では登録が出来ない' do
        @order.order_status_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('Order statusを入力してください')
      end

      it 'userが紐づいていないと登録が出来ない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Userを入力してください')
      end

      it '商品が紐づいていないと登録が出来ない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Itemを入力してください')
      end
    end
  end
end
