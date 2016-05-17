module Atlas
  class Indication < Base

    self.primary_key = 'id'

    class << self

      def resource_name
        'indications'
      end

      def index
        response = get resource_name
      end

    end
  end
end


