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
      self.dolar(nil)
      self.console_print('euro', @data['euro'], "Euro: R$ #{@data['euro']['cotacao']} - Variação: #{@data['euro']['variacao']}")
      self.console_print('bovespa', @data['bovespa'], "Bovespa: #{@data['bovespa']['cotacao']} - Variação: #{@data['bovespa']['variacao']}")
    end

    def dolar(convert_to)
      dolar             = @data['dolar']
      cotacao           = dolar['cotacao']
      variacao          = dolar['variacao']
      convertion_string = ''

      if convert_to
        convertion_string = "- Em Reais: R$ #{self.convert(cotacao, convert_to)}"
      end

      self.console_print('dolar', dolar, "Dolar: R$ #{cotacao} - Variação: #{variacao} #{convertion_string}")
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

    def convert(foreign_currency, real)
      '%.2f' % (real.to_f * foreign_currency.to_f)
    end

  end
end
