require 'rails_helper'

describe WordsController do
  let(:user) { create(:user) }

  #indexアクションのコントローラテスト
  describe 'GET #index' do
    context 'ログイン時' do
      before do
        login user
      end
      it "index.html.erbに遷移すること" do
        get :index
        expect(response).to render_template :index
      end

      it "正常なレスポンスか" do
        get :index
        expect(response).to be_success
      end
    end
  end

  #newアクションのテスト
  describe 'GET #new' do
    context 'ログイン時' do
      before do
        login user
      end

      it "new.html.erbに遷移すること" do
        get :new
        expect(response).to render_template :new
      end
    end

    context '未ログイン時' do
      it "ログインページに遷移するか" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'ログイン時' do
      before do
        login user
      end

      it 'indexにリダイレクトすること' do
        word = { word: attributes_for(:word) }
        post :create, params: word
        expect(response).to redirect_to words_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'ログイン時' do
      before do
        login user
      end

      it "トップページにリダイレクトすること" do
        word = create(:word, user_id: user.id)
        delete :destroy, params: { id: word.id }
        expect(response).to redirect_to words_path
      end
    end
  end
end