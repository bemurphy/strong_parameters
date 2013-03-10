require 'rails/generators/test_case'
require 'generators/rails/strong_parameters_initializer_generator'

class StrongParametersInitializerGeneratorTest < Rails::Generators::TestCase
  tests Rails::Generators::StrongParametersInitializerGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  def test_initializer_content
    Rails.stubs(:application).returns(nil)
    run_generator

    assert_file "config/initializers/strong_parameters.rb" do |content|
      init_code = 'ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)'
      assert_match init_code, content
    end
  end
end
