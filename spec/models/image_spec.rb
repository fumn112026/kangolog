require 'rails_helper'

describe Image do
  describe '#create' do
    it "srcが存在すれば登録できること" do
      image = create(:image)
      expect(image).to be_valid
    end
  end
end
