class MysqlConnector
  MYSQL_OPERATIONS_HOST = ENV['MYSQL_OPERATIONS_HOST']
  MYSQL_OPERATIONS_USER = ENV['MYSQL_OPERATIONS_USER']
  MYSQL_OPERATIONS_PASSWORD = ENV['MYSQL_OPERATIONS_PASSWORD']
  MYSQL_OPERATIONS_SSLCA = ENV['MYSQL_OPERATIONS_SSLCA']

  def operation
    client = Mysql2::Client.new(host: MYSQL_OPERATIONS_HOST,
                                username: MYSQL_OPERATIONS_USER,
                                password: MYSQL_OPERATIONS_PASSWORD,
                                ssl_mode: :verify_identity,
                                sslca: MYSQL_OPERATIONS_SSLCA)

    query = 'select version();'
    client.query(query).first
  end
end