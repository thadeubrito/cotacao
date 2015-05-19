require "cotacao/version"
require 'httparty'
require 'json'

module Cotacao
  class Cotacao

    def initialize
      apiUrl = 'http://developers.agenciaideias.com.br/cotacoes/json'
      response = HTTParty.get(apiUrl)
      @cotacoes = JSON.parse(response.body)
    end

    def now
      puts "Dolar: R$ #{@cotacoes['dolar']['cotacao']} - Variação: #{@cotacoes['dolar']['variacao']}"
    end
  end
end
