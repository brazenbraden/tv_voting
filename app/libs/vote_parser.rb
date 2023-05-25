# frozen_string_literal: true

class VoteParser
  attr_reader :data

  def initialize
    contestant_hash = Hash.new { |h, k| h[k] = { votes: 0, uncounted: 0 } }
    @data = Hash.new { |ch, ck| ch[ck] = contestant_hash }
  end

  def parse(line)
    campaign, validity, contestant = line.split(" ")[2..4].map { |str| str.split(":").last }

    if validity == "during"
      data[campaign][contestant][:votes] += 1
    else
      data[campaign][contestant][:uncounted] += 1
    end
  end
end
