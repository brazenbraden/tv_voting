# frozen_string_literal: true

class Parser
  class MissingFileError < StandardError; end

  attr_reader :filename, :vote_parser

  def initialize(filename)
    @filename = filename.to_s
    @vote_parser = VoteParser.new
  end

  def call(data_mapper: Relational)
    file.readlines.each do |line|
      vote_parser.parse(line.scrub.chomp.chomp)
    end

    data_mapper.call(vote_parser.data)

    puts "Vote log processed."
  end

  def file
    raise MissingFileError if filename.empty?
    raise MissingFileError unless File.file?(filename)

    File.open(filename)
  end
end

# CLI
if __FILE__ == $0
  begin
    Parser.new(ARGV[0]).call
    exit(0)
  rescue StandardError=> e
    STDERR.puts e.message
    exit(1)
  end
end
