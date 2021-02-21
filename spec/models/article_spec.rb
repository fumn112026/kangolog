require 'rails_helper'

describe Article do
  describe '#create' do
    it "titleとcontentが存在すれば登録できること" do
      article = build(:article)
      expect(article).to be_valid
    end

    it "titleがない場合は登録できないこと" do
      article = build(:article, title: nil)
      article.valid?
      expect(article.errors[:title]).to include("can't be blank")
    end

    it "contentがない場合は登録できないこと" do
      article = build(:article, content: nil)
      article.valid?
      expect(article.errors[:content]).to include("can't be blank")
    end
  end

  describe '#destroy' do
    it "記事を削除するとコメントも削除されること" do
      user = create(:user)
      article = create(:article)
      com = article.comments.create(text: "素晴らしい記事ですね。", user: user)
      expect{ article.destroy }.to change{ Comment.count }.by(-1)
    end

    it "記事を削除すると画像も削除されること" do
      article = create(:article)
      image = create(:image, article: article)
      expect{ article.destroy }.to change{ Image.count }.by(-1)
    end

    it "記事を削除するとtag_relationも削除されること" do
      article = create(:article)
      tag = Tag.create(name: "test tag")
      tag_rel = article.tag_relations.create(tag: tag)
      expect{ article.destroy }.to change{ TagRelation.count }.by(-1)
    end
  end

  # 検索文字列に一致するメッセージを検索する
  describe '#search' do
    before do
      @article1 = create(:article)
      @article2 = create(:article, title: "医師について")
      @article3 = create(:article, title: "看護観について")
    end

    context "一致するデータが見つかるとき" do
      it "一致する記事を返すこと" do
        expect(Article.search("看護")).to include(@article1, @article3)
      end
    end

    context "一致するデータが見つからないとき" do
      it "空のメッセージを返すこと" do
        expect(Article.search("リハビリ")).to be_empty
      end
    end

    context "検索文字列が空白のとき" do
      it "全ての記事を返すこと" do
        expect(Article.search("")).to include(@article1, @article2, @article3)
      end
    end
  end
end
