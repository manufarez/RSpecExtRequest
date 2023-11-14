class User
  def import
    content = call_api('https://jsonplaceholder.org/users')
    user = JSON.parse(content)
    user.first()["firstname"]
  end

  private

  def call_api(uri)
    Net::HTTP.get(URI.parse(uri))
  end
end
