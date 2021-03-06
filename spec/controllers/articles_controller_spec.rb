require 'rails_helper'

describe ArticlesController, type: :controller do

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@articleに正しい値が入っていること" do
      article = create(:article)
      get :edit, params: { id: article }
      expect(assigns(:article)).to eq article
    end

    it "edit.html.hamlに遷移すること" do
      article = create(:article)
      get :edit, params: { id: article }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@articlesに正しい値が入っていること" do
      articles = create_list(:article, 3)
      get :index
      expect(assigns(:articles)).to match(articles.sort{ |a, b| b.created_at <=> a.created_at } )
    end
    
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

end
