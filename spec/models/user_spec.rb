require 'rails_helper'

describe User do
  describe '#create' do
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    
    it "nicknameが8文字以内であれば登録できること" do
      user = build(:user, nickname: "yamamoto")
      expect(user).to be_valid
    end

    it "nicknameが9文字以上では登録できないこと" do
      user = build(:user, nickname: "ayanokoji")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 8 characters)")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it " passwordが6文字以上であれば登録できること " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it " passwordが5文字以下であれば登録できないこと " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end

  describe "#destroy" do
    before do
      @user = create(:user)
    end

    it "ユーザーが削除されると記事も削除されること" do
      article = create(:article, user: @user)
      expect{ article.destroy }.to change{ Article.count }.by(-1)
    end
    
    it "ユーザーが削除されるとコメントも削除されること" do
      article = create(:article)
      comment = @user.comments.create(text: "素晴らしい記事ですね", article: article)
      expect{ @user.destroy }.to change{ Comment.count }.by(-1)
    end
  end

  describe "#already_liked?" do
    before do
      @user = create(:user)
      @article = create(:article)
    end

    it "既にいいねがあればtrueとなること" do
      like = @user.likes.create(article: @article)
      expect(@user.already_liked?(@article)).to be_truthy
    end

    it "いいねがなけれなfalseとなること" do
      expect(@user.already_liked?(@article)).to be_falsey
    end
  end
end
