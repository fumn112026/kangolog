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
