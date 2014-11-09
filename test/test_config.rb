RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers.rb")].each(&method(:require))

class MiniTest::Test
  include Rack::Test::Methods

  alias_method :_original_run, :run

  def run(*args, &block)
    result = nil
    Sequel::Model.db.transaction(:rollback => :always, :auto_savepoint=>true) do
      result = _original_run(*args, &block)
    end
    result
  end

  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end
end
