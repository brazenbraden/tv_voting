# frozen_string_literal: true

class VoteParser
  attr_reader :data

  def initialize
    @data = Hash.new { |ch, ck| ch[ck] = {} }
  end

  def parse(line)
    entry, _time, campaign, validity, contestant = line.split(" ")[0..4].map { |str| str.split(":").last }
    return unless entry == "VOTE"

    contestant_data = @data[campaign][contestant]
    if contestant_data.nil?
      @data[campaign][contestant] = { votes: 0, uncounted: 0 }
    end

    if validity == "during"
      data[campaign][contestant][:votes] += 1
    else
      data[campaign][contestant][:uncounted] += 1
    end
  end
end
