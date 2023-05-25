# frozen_string_literal: true

require "vote_parser"

RSpec.describe VoteParser do
  let(:klass) { described_class.new }
  let(:expected_data) do
    {
      "ssss_uk_01B" => {
        "Antony" => {
          votes: votes,
          uncounted: uncounted
        }
      }
    }
  end
  let(:votes) { 0 }
  let(:uncounted) { 0 }

  before { klass.parse(line) }

  context "with valid vote" do
    let(:line) do
      "VOTE 1168041805 Campaign:ssss_uk_01B Validity:during Choice:Antony CONN:MIG01TU MSISDN:00777778359999 GUID:E6109CA1-7756-45DC-8EE7-677CA7C3D7F3 Shortcode:63334"
    end
    let(:votes) { 1 }

    specify do
      expect(klass.data).to eq(expected_data)
    end
  end

  context "with pre vote" do
    let(:line) do
      "VOTE 1168041805 Campaign:ssss_uk_01B Validity:pre Choice:Antony CONN:MIG01TU MSISDN:00777778359999 GUID:E6109CA1-7756-45DC-8EE7-677CA7C3D7F3 Shortcode:63334"
    end
    let(:uncounted) { 1 }

    specify do
      expect(klass.data).to eq(expected_data)
    end
  end
end
