require "rails_helper"

RSpec.describe BooleanParamsConverter do
  describe "#clean" do
    it "should convert each boolean string to a real boolean" do
      raw_params = {
        a: "true",
        b: "false"
      }

      clean_params = subject.call(raw_params)

      expect(clean_params[:a]).to eq(true)
      expect(clean_params[:b]).to eq(false)
    end
  end
end
