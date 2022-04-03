require 'rails_helper'

RSpec.describe "商品の新規登録", type: :system do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.create(:user)
  end

  context '商品登録ができる時' do
    it 'ログインし、必要な情報を入力すれば商品の登録を行うことができる。' do
      #サインインする
      sign_in(@user)
      #商品管理ページへと移動する
      visit new_item_path
      #添付する画像ファイルの定義
      image_path = Rails.root.join('public/images/test_image.png')
      #画像を添付する
      attach_file('item[image]', image_path)
      #商品名を入力す
      fill_in 'item-name', with: @item.name
      #商品分類を選択する(idと料理名がFormに紐づいていないので個別指定しか出来ない)
      select 'メイン料理', from: 'item_item_class_id'
      #商品の説明を入力する
      fill_in 'item-info', with: @item.explanation
      #購入先を入力する
      fill_in 'item-retailer', with: @item.retailer
      #価格を入力する
      fill_in 'item-price', with: @item.price
      #在庫を入力する
      fill_in 'item-quantity', with: @item.quantity
      #[登録する]ボタンを押すと商品モデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      #トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      #登録した商品がトップページに表示されていることを確認する
      expect(page).to have_content(@item.name)
    end
  end

  context '商品登録ができないとき' do
    it 'ログインしていない状態で商品管理ページへアクセスした場合、サインインページへ移動する' do
      #商品管理ページへと移動する
      visit new_item_path
      #サインインページへ遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
    end

    it 'ログイン後、必要な情報を入力していない場合、商品登録をすることが出来ない' do
      #サインインする
      sign_in(@user)
      #商品管理ページへ移動する
      visit new_item_path
      #添付する画像ファイルの定義
      image_path = Rails.root.join('public/images/test_image.png')
      #画像を添付する
      attach_file('item[image]', image_path)
      #商品名を入力する商品の説明、購入先、価格、在庫を入力する。
      fill_in 'item-name', with: ''
      #商品分類を選択する(idと料理名がFormに紐づいていないので個別指定しか出来ない)
      select 'メイン料理', from: 'item_item_class_id'
      #商品の説明を入力する
      fill_in 'item-info', with: ''
      #購入先を入力する
      fill_in 'item-retailer', with: ''
      #価格を入力する
      fill_in 'item-price', with: ''
      #在庫を入力する
      fill_in 'item-quantity', with: ''
      #[登録する]ボタンを押しても商品モデルのカウントが変化しないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(0)
      #商品登録ページへ戻っていることを確認する
      expect(current_path).to eq(items_path)
    end
  end
end
