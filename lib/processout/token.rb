# The content of this file was automatically generated

require "cgi"
require "processout/networking/request"
require "processout/networking/response"

module ProcessOut
  class Token
    
    attr_reader :id
    attr_reader :customer
    attr_reader :card
    attr_reader :type
    attr_reader :metadata
    attr_reader :is_subscription_only
    attr_reader :created_at

    
    def id=(val)
      @id = val
    end
    
    def customer=(val)
      if val.instance_of? Customer
        @customer = val
      else
        obj = Customer.new(@client)
        obj.fill_with_data(val)
        @customer = obj
      end
      
    end
    
    def card=(val)
      if val.instance_of? Card
        @card = val
      else
        obj = Card.new(@client)
        obj.fill_with_data(val)
        @card = obj
      end
      
    end
    
    def type=(val)
      @type = val
    end
    
    def metadata=(val)
      @metadata = val
    end
    
    def is_subscription_only=(val)
      @is_subscription_only = val
    end
    
    def created_at=(val)
      @created_at = val
    end
    

    # Initializes the Token object
    # Params:
    # +client+:: +ProcessOut+ client instance
    # +data+:: data that can be used to fill the object
    def initialize(client, data = {})
      @client = client

      @id = data.fetch(:id, "")
      @customer = data.fetch(:customer, nil)
      @card = data.fetch(:card, nil)
      @type = data.fetch(:type, "")
      @metadata = data.fetch(:metadata, Hash.new)
      @is_subscription_only = data.fetch(:is_subscription_only, false)
      @created_at = data.fetch(:created_at, "")
      
    end

    # Create a new Token using the current client
    def new(data = {})
      Token.new(@client, data)
    end

    # Fills the object with data coming from the API
    # Params:
    # +data+:: +Hash+ of data coming from the API
    def fill_with_data(data)
      if data.include? "id"
        self.id = data["id"]
      end
      if data.include? "customer"
        self.customer = data["customer"]
      end
      if data.include? "card"
        self.card = data["card"]
      end
      if data.include? "type"
        self.type = data["type"]
      end
      if data.include? "metadata"
        self.metadata = data["metadata"]
      end
      if data.include? "is_subscription_only"
        self.is_subscription_only = data["is_subscription_only"]
      end
      if data.include? "created_at"
        self.created_at = data["created_at"]
      end
      
      self
    end

    # Find a customer's token by its ID.
    # Params:
    # +customer_id+:: ID of the customer
    # +token_id+:: ID of the token
    # +options+:: +Hash+ of options
    def find(customer_id, token_id, options = {})
      request = Request.new(@client)
      path    = "/customers/" + CGI.escape(customer_id) + "/tokens/" + CGI.escape(token_id) + ""
      data    = {

      }

      response = Response.new(request.get(path, data, options))
      return_values = Array.new
      
      body = response.body
      body = body["token"]
      
      
      obj = Token.new(@client)
      return_values.push(obj.fill_with_data(body))
      

      
      return_values[0]
    end

    # Create a new token for the given customer ID.
    # Params:
    # +customer_id+:: ID of the customer
    # +source+:: Source used to create the token (most likely a card token generated by ProcessOut.js)
    # +options+:: +Hash+ of options
    def create(customer_id, source, options = {})
      request = Request.new(@client)
      path    = "/customers/" + CGI.escape(customer_id) + "/tokens"
      data    = {
        "metadata" => @metadata, 
        "source" => source
      }

      response = Response.new(request.post(path, data, options))
      return_values = Array.new
      
      body = response.body
      body = body["token"]
      
      
      return_values.push(self.fill_with_data(body))
      

      
      return_values[0]
    end

    # Create a new token for the given customer ID from an authorization request
    # Params:
    # +customer_id+:: ID of the customer
    # +source+:: Source used to create the token (most likely a card token generated by ProcessOut.js)
    # +target+:: Authorization request ID
    # +options+:: +Hash+ of options
    def create_from_request(customer_id, source, target, options = {})
      request = Request.new(@client)
      path    = "/customers/" + CGI.escape(customer_id) + "/tokens"
      data    = {
        "metadata" => @metadata, 
        "source" => source, 
        "target" => target
      }

      response = Response.new(request.post(path, data, options))
      return_values = Array.new
      
      body = response.body
      body = body["token"]
      
      
      return_values.push(self.fill_with_data(body))
      

      
      return_values[0]
    end

    
  end
end
