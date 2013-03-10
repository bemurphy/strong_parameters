module Rails
  module Generators
    class StrongParametersInitializerGenerator < Rails::Generators::Base
      desc "Creates an initializer file to enforce strong parameters on all ActiveRecord models"

      def create_initializer_file
        create_file "config/initializers/strong_parameters.rb", initializer_content
      end

      def initializer_content
        "ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)\n"
      end
    end
  end
end
