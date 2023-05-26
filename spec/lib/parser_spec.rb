# frozen_string_literal: true

require "rails_helper"
require "parser"

RSpec.describe Parser do
  let(:klass) { described_class.new(file_name) }
  let(:file_name) { "votes.txt"}

  it "fails if no filename is provided" do
    expect { described_class.new(nil).call }.to raise_error(Parser::MissingFileError)

  end
  it "fails if no filename is provided" do
    expect { described_class.new("").call }.to raise_error(Parser::MissingFileError)
  end

  it "fails if file not found" do
    expect { described_class.new("nofile.txt").call }.to raise_error(Parser::MissingFileError)
  end

  it "processes a vote log file" do
    expect(klass.call).to be_nil
  end

  context "with real data" do
    before { klass.call }

    it "adds all the campaigns" do
      expect(Campaign.all.count).to eq(4)
    end

    it "adds all the contestants" do
      expect(Contestant.all.count).to eq(40)
    end

    it "adds contestants to a campaign" do
      expect(Campaign.first.contestants.count).to eq(11)
    end

    it "is correct" do
      contestants = Campaign.find_by(name: "Emmerdale").contestants.pluck(:name)
      expect(contestants).not_to include("Antony")
    end
  end
end
