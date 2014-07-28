require "rails_helper"

RSpec.describe CourseLevelDeterminer do
  describe "#call" do
    context "given an empty params" do
      let(:params) { {} }

      it "should add the beginner level" do
        processed_params = subject.call(params)

        expect(processed_params).to match({level: "beginner"})
      end
    end

    context "given params include 'programmed_before' but not 'rails_before'" do
      let(:params) { {programmed_before: true} }

      it "should add the intermediate level" do
        processed_params = subject.call(params)

        expect(processed_params).to match({level: "intermediate"})
      end

      it "should remove the 'programmed_before' params" do
        processed_params = subject.call(params)

        expect(processed_params).not_to include({programmed_before: true})
      end
    end

    context "given params include 'programmed_before' and 'rails_before'" do
      let(:params) { {programmed_before: true, rails_before: true} }

      it "should add the intermediate level" do
        processed_params = subject.call(params)

        expect(processed_params).to match({level: "advanced"})
      end

      it "should remove the 'programmed_before' and 'rails_before' params" do
        processed_params = subject.call(params)

        expect(processed_params).not_to include({programmed_before: true})
        expect(processed_params).not_to include({rails_before: true})
      end
    end
  end
end
