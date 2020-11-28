require 'rails_helper'

describe Article do
  describe '#create' do

    it "titleとcontent、user_id存在すれば登録できること" do
      user = create(:user)
      article = user.articles.build(
        title: "aaa",
        content: "aaa",
      )
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
end
