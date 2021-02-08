require 'rails_helper'

describe Comment do
  describe '#create' do

    it "textが存在すれば登録できること" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "textがない場合は登録できないこと" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

  end
end
