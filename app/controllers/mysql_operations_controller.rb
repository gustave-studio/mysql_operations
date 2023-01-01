class MysqlOperationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def operation
    @version = MysqlConnector.new.operation
  end
end
