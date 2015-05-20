require "cotacao/version"
require 'httparty'
require 'json'
require 'colorize'

module Cotacao
  class Cotacao

    def initialize
      apiUrl   = 'http://developers.agenciaideias.com.br/cotacoes/json'
      response = HTTParty.get(apiUrl)
      @data    = JSON.parse(response.body)
    end

    def now
      self.console_print('dolar', @data['dolar'], "Dolar: R$ #{@data['dolar']['cotacao']} - Variação: #{@data['dolar']['variacao']}")
      self.console_print('euro', @data['euro'], "Euro: R$ #{@data['euro']['cotacao']} - Variação: #{@data['euro']['variacao']}")
      self.console_print('bovespa', @data['bovespa'], "Bovespa: #{@data['bovespa']['cotacao']} - Variação: #{@data['bovespa']['variacao']}")
    end

    def console_print(type, cotacao, copy)
      puts '----------------------'
      puts paint(copy, cotacao['variacao'].to_f)
    end

    def status(variation)
      if variation > 0.00
        return 'positive'
      elsif variation == 0.00
        return 'stable'
      elsif variation < 0.00
        return 'negative'
      end
    end

    def paint(copy, variation)
      variation_status = status(variation)
      if variation_status == 'positive'
        "  ↑↑ #{copy} ↑↑".green
      elsif variation_status == 'stable'
        "  ●● #{copy} ●●".yellow
      elsif variation_status == 'negative'
        "  ↓↓ #{copy} ↓↓".red
      end
    end

  end
end
