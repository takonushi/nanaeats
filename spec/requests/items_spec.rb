require 'rails_helper'

RSpec.describe "Items", type: :request do

  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    sleep(0.5)
  end
  describe 'GET #index' do
    context "ログインしている場合" do
      before do
        sign_in @user
      end
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスにログアウトが存在する" do
        get root_path
        expect(response.body).to include("ログアウト")
      end
      it "indexアクションにリクエストするとレスポンスにマスター管理が存在する" do
        get root_path
        expect(response.body).to include("マスター管理")
      end
      it "indexアクションにリクエストするとレスポンスにオーダークリアが存在する" do
        get root_path
        expect(response.body).to include("オーダークリア")
      end
      it "indexアクションにリクエストするとレスポンスに詳細検索が存在する" do
        get root_path
        expect(response.body).to include("詳細検索")
      end
      it "indexアクションにリクエストするとレスポンスにスケジュール表が存在する" do
        get root_path
        expect(response.body).to include("スケジュール表")
      end
      it "indexアクションにリクエストするとレスポンスに在庫一括修正が存在する" do
        get root_path
        expect(response.body).to include("在庫一括修正")
      end
      it "indexアクションにリクエストするとレスポンスにマイページが存在する" do
        get root_path
        expect(response.body).to include("マイページ")
      end
      it "indexアクションにリクエストするとレスポンスに新機能検証用が存在する" do
        get root_path
        expect(response.body).to include("新機能検証用")
      end

      it "indexアクションにリクエストすると登録済み商品が存在する" do
        get root_path
        expect(response.body).to include(@item.name)
      end
      it "indexアクションにリクエストすると検索フォームが存在する" do
        get root_path
        expect(response.body).to include("商品分類")
      end
    end

    context "ログインしていない場合" do
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスにログインが存在する" do
        get root_path
        expect(response.body).to include("ログイン")
      end
      it "indexアクションにリクエストするとレスポンスに新規登録が存在する" do
        get root_path
        expect(response.body).to include("新規登録")
      end
    end
  end
end
