#this spec will make actual api calls
require 'colo_biz'
require 'spec_helper'

  RSpec.describe ColoBiz do

    describe 'Data_Fetcher functionality' do
      it 'initializes' do
        data_fetcher = ColoBiz::DataFetcher::Faraday.new
        expect(data_fetcher.class).to eq Faraday::Connection
      end

      it "sets @url on initialize" do
        data_fetcher = ColoBiz::DataFetcher::Faraday.new(:url => 'https://data.colorado.gov')
        expect(data_fetcher.url_prefix.to_s).to eq 'https://data.colorado.gov/'
      end
    end

#############Query Methods################
    describe 'entity name response' do
      it 'returns a hash of entity information on successfull request' do
        gold_hill = ColoBiz::DataFetcher.new.search_by_entity_name("GOLD HILL MESA JOINT VENTURE, LLC")
        expect(gold_hill.first.entity_name).to eq "GOLD HILL MESA JOINT VENTURE, LLC"
      end

    end

  end

  # end
