# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'


class Ollama::Client
  attr_accessor :timeout, :model

  def initialize
    @timeout = 120
    @model = 'mistral'
  end

  def chat(prompt)
    uri = URI('http://localhost:11434/api/chat')

    request = Net::HTTP::Post.new(uri)
    request.content_type = 'application/json'

    request.body = JSON.generate({
      model: model,
      messages: [
        {
          role: 'user',
          content: prompt
        }
      ],
      stream: false
    })

    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.read_timeout = timeout
      http.request(request)
    end

    JSON.parse(response.body)
  end


  def models
    uri = URI('http://localhost:11434/api/models')
    request = Net::HTTP::Get.new(uri)

    # request.content_type = 'application/json'
    #
    # request.body = JSON.generate({
    #   model: model,
    #   messages: [
    #     {
    #       role: 'user',
    #       content: prompt
    #     }
    #   ],
    #   stream: false
    # })

    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.read_timeout = timeout
      http.request(request)
    end

    response
  end
end
