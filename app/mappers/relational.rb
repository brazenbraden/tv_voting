# frozen_string_literal: true

class Relational
  def initialize(data)
    @data = data
  end

  def call
    data.each do |campaign_name, contestant_data|
      campaign = Campaign.where(name: campaign_name).first_or_create!

      contestant_data.each do |contestant|
        campaign.contestants.create!(contestant.last.merge(name: contestant.first))
      end
    end
  end

  def self.call(data)
    new(data).call
  end

  private

  attr_reader :data
end
