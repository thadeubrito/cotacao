require "cotacao/version"
require 'httparty'
require 'json'

module Cotacao
  class Cotacao

    def initialize
      apiUrl = 'http://developers.agenciaideias.com.br/cotacoes/json'
      response = HTTParty.get(apiUrl)
      @quotations = JSON.parse(response.body)
    end

    def now
      puts @quotations["dolar"]["cotacao"]
    end
  end
end
