require 'rails_helper'

describe Article do
  describe '#create' do

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
