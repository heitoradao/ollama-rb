#! /usr/bin/env ruby

require 'ollama'
require 'readline'
require 'tty-markdown'
require 'optparse'

options = {
  model: 'llama3.2',
  timeout: 120,
  output: 'output.md'
}

parser = OptionParser.new do |opts|
  opts.on('-h', '--help') do
    options[:help] = true
  end

  opts.on('-o', '--output=OUTPUT') do |output|
    options[:output] = output
  end

  opts.on('-t', '--timeout=TIMEOUT') do |timeout|
    options[:timeout] = timeout
  end

  opts.on('-m', '--model=MODEL') do |model|
    options[:model] = model
  end
end

parser.parse!

if options[:help]
  puts parser
  exit 1
end

puts "What is your wish?"
prompt = Readline.readline

cli = Ollama::Client.new
cli.timeout = options[:timeout]
data = cli.chat(prompt)

content = data['message']['content']
puts TTY::Markdown.parse(content)

File.write(options[:output], content)

