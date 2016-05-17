require 'active_resource'

module Atlas
  class Base < ActiveResource::Base

    class << self

      def site
        "http://private-40030-rockrater.apiary-mock.com/"
      end

      def username
        'test'
      end

      def password
        'test'
      end

      def values
        {
          _un: username,
          _pwd: password,
         :content_type => :json,
         :accept => :json
        }
      end

      def headers
        {
          :content_type => 'application/json'
        }
      end

      def get(resource)
        eval(RestClient.get(site + resource, values))
      end


    end
  end
end
