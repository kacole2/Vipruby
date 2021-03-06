require 'rest-client'
require 'json'

class Vcenter

  def initialize (fqdn_or_ip, name, port, user_name, password, api_url, verify_cert, auth_token)
    @fqdn_or_ip = fqdn_or_ip
    @name = name
    @port = port
    @user_name = user_name
    @password = password
    @api_url = api_url
    @verify_cert = verify_cert
    @auth_token = auth_token
  end

  def fqdn_or_ip
    @fqdn_or_ip
  end
  
  def name
    @name
  end
  
  def port
    @port
  end
  
  def user_name
    @user_name
  end
  
  def password
    @password
  end
  
  def api_url
    @api_url
  end

  def add
    payload = {
      ip_address: @fqdn_or_ip,
      name: @name,
      port_number: @port,
      user_name: @user_name,
      password: @password
    }.to_json
    
    RestCall.rest_post(payload, @api_url, @verify_cert, @auth_token)
  end

  def Vcenter.add_datacenter(name, api_url, verify_cert, auth_token)
    payload = {
      name: name
    }.to_json
    
    RestCall.rest_post(payload, api_url, verify_cert, auth_token)
  end

  def Vcenter.delete(api_url, verify_cert, auth_token)
    payload = {
    }.to_json
    
    RestCall.rest_post(payload, api_url, verify_cert, auth_token)
  end

end 
