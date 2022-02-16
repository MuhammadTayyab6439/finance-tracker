class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new( publishable_token: 'Tpk_7d709e6e2b544265bb06756cf59f0e94',
                                        endpoint: 'https://sandbox.iexapis.com/v1')
        client.price(ticker_symbol)

    end
end
