require 'spec_helper'

require 'rack/test'
RSpec.configure { |c| c.include Rack::Test::Methods }

class RootMapper < Yaks::Mapper
  link :self, '/'
  link :posts, '/posts'
end

class PostMapper < Yaks::Mapper
  attributes :title, :body, :date
  has_one :author
end

POSTS = []

class MyApp < Syro::Deck
  include Yaks::Syro

  configure_yaks do
  end

  def self.app
    Syro.new(self) {
      root {
        yaks({}, mapper: RootMapper)
      }

      on("posts") {
        yaks POSTS
      }
    }
  end
end

describe Yaks::Syro do
  subject(:app){ MyApp.app }

  it "applies yaks" do
    expect( get('/') ).to be_ok
  end

  it "sets the media type" do
    expect( get('/').headers ).to include("Content-Type"=>"application/hal+json")
  end

  it "accepts different media types" do
    header 'Accept', 'application/vnd.api+json'
    expect( get('/').headers ).to include("Content-Type"=>"application/vnd.api+json")
  end

end
