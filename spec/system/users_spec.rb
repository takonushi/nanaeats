require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      #トップページへ移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認用）', with: @user.password_confirmation
      #サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      #トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      #ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      #サインアップへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する。
      #expect(page).to have_no_content('ログイン') ログインしていますという文言があるため、エラーになる。
      expect(page).to have_no_content('新規登録')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      #トップページへ移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'ニックネーム', with: ''
      fill_in 'Eメール', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード（確認用）', with: ''

      #サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する。
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      #新規登録ページへ戻されたことを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできる時' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      #トップページへ移動する
      visit root_path
      #トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ遷移する
      visit new_user_session_path
      #正しいユーザー情報を入力する
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      #ログインボタンを押す
      find('input[name="commit"]').click
      #トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      #ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      #サインアップページやログインページに遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      #トップページへ移動する
      visit root_path
      #トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ遷移する
      visit new_user_session_path
      #ユーザー情報を入力する
      fill_in 'Eメール', with: 'hogehoge@hogehoge.jp'
      fill_in 'パスワード', with: 'hogehogehoge'
      #ログインボタンを押す
      find('input[name="commit"]').click
      #ログインページへ戻されたことを確認する
      expect(current_path).to eq user_session_path
    end
  end
end

