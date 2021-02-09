require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "タグ名があれば保存できること" do
    tag = Tag.new(name: "test tag")
    expect(tag).to be_valid
  end

  it "タグ名がなければ保存できないこと" do
    tag = Tag.new(name: nil)
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

  it "タグ名がユニークであれば保存できること" do
    tag = Tag.create(name: "test tag")
    another_tag = Tag.new(name: "sample tag")
    expect(another_tag).to be_valid
  end

  it "タグ名がユニークでなければ保存できないこと" do
    tag = Tag.create(name: "test tag")
    another_tag = Tag.new(name: tag.name)
    another_tag.valid?
    expect(another_tag.errors[:name]).to include("has already been taken")
  end

  describe "#destroy" do
    it "タグを削除するとtag_relationも削除されること" do
      article = create(:article)
      tag = Tag.create(name: "test tag")
      tag_rel = tag.tag_relations.create(article: article)
      expect{ tag.destroy }.to change{ TagRelation.count }.by(-1)
    end
  end
end
