require 'uri'
require 'net/http'

class SearchDescriptionJob < ApplicationJob
  queue_as :default

  def perform(book_id)
    book = Book.find(book_id)
    # guarclose = if else
    return if book.nil?
    return if book.isbn.empty?

    url = URI("https://openlibrary.org/api/books?bibkeys=ISBN:#{book.isbn}&format=json")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    body = JSON.parse(response.read_body)
    book.update!(description: body[body.keys.first]['info_url'])
  end
end
