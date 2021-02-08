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

end
