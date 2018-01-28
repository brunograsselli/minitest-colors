require "minitest-colors/version"
require "minitest"

module MinitestColors
  Minitest.extensions << "colors"
end

module Minitest
  def self.plugin_colors_init(options)
    io = ColorfulReport.new options[:io]

    self.reporter.reporters.grep(Minitest::Reporter).each do |rep|
      rep.io = io
    end
  end

  class ColorfulReport
    attr_reader :io

    def initialize(io)
      @io = io
    end

    def print o
      case o
      when "." then
        io.print "\e[39m\e[32m#{o}\e[0m"
      when "E", "F" then
        io.print "\e[39m\e[31m#{o}\e[0m"
      when "S" then
        io.print "\e[39m\e[33m#{o}\e[0m"
      else
        io.print o
      end
    end

    def method_missing(msg, *args)
      io.send(msg, *args)
    end
  end
end

