require "cotacao/version"
require 'httparty'
require 'json'

module Cotacao
  class Cotacao

    def initialize
      apiUrl   = 'http://developers.agenciaideias.com.br/cotacoes/json'
      response = HTTParty.get(apiUrl)
      @data     = JSON.parse(response.body)
    end

    def now
      console_print("Dolar: R$ #{@data['dolar']['cotacao']} - Variação: #{@data['dolar']['variacao']}")
      console_print("Euro: R$ #{@data['euro']['cotacao']} - Variação: #{@data['euro']['variacao']}")
      console_print("Bovespa: #{@data['bovespa']['cotacao']} - Variação: #{@data['bovespa']['variacao']}")
    end

    def console_print(cotacao)
      puts '----------------------'
      puts cotacao
    end

  end
end
