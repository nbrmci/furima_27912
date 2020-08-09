require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'ItemsController' do
    let (:response) { get :new }
    it "ログイン中のユーザーだけが出品ページに遷移できる" do
      ＠user = FactoryBot.build(:user)
      expect(＠user).to be_valid
    end
    before do
      @user = FactoryBot.build(:user)
    end

    it "ログインしている場合のページ遷移" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      get :new
      expect(response).to be_successful
    end

    it "ログインしていない場合のページ遷移" do
      @user = FactoryBot.build(:user)
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end
end