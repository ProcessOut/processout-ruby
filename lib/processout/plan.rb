# The content of this file was automatically generated

require "cgi"
require "json"
require "processout/networking/request"
require "processout/networking/response"

module ProcessOut
  class Plan
    
    attr_reader :id
    attr_reader :project
    attr_reader :project_id
    attr_reader :url
    attr_reader :name
    attr_reader :amount
    attr_reader :currency
    attr_reader :metadata
    attr_reader :interval
    attr_reader :trial_period
    attr_reader :return_url
    attr_reader :cancel_url
    attr_reader :sandbox
    attr_reader :created_at

    
    def id=(val)
      @id = val
    end
    
    def project=(val)
      if val.nil?
        @project = val
        return
      end

      if val.instance_of? Project
        @project = val
      else
        obj = Project.new(@client)
        obj.fill_with_data(val)
        @project = obj
      end
      
    end
    
    def project_id=(val)
      @project_id = val
    end
    
    def url=(val)
      @url = val
    end
    
    def name=(val)
      @name = val
    end
    
    def amount=(val)
      @amount = val
    end
    
    def currency=(val)
      @currency = val
    end
    
    def metadata=(val)
      @metadata = val
    end
    
    def interval=(val)
      @interval = val
    end
    
    def trial_period=(val)
      @trial_period = val
    end
    
    def return_url=(val)
      @return_url = val
    end
    
    def cancel_url=(val)
      @cancel_url = val
    end
    
    def sandbox=(val)
      @sandbox = val
    end
    
    def created_at=(val)
      @created_at = val
    end
    

    # Initializes the Plan object
    # Params:
    # +client+:: +ProcessOut+ client instance
    # +data+:: data that can be used to fill the object
    def initialize(client, data = {})
      @client = client

      self.id = data.fetch(:id, nil)
      self.project = data.fetch(:project, nil)
      self.project_id = data.fetch(:project_id, nil)
      self.url = data.fetch(:url, nil)
      self.name = data.fetch(:name, nil)
      self.amount = data.fetch(:amount, nil)
      self.currency = data.fetch(:currency, nil)
      self.metadata = data.fetch(:metadata, nil)
      self.interval = data.fetch(:interval, nil)
      self.trial_period = data.fetch(:trial_period, nil)
      self.return_url = data.fetch(:return_url, nil)
      self.cancel_url = data.fetch(:cancel_url, nil)
      self.sandbox = data.fetch(:sandbox, nil)
      self.created_at = data.fetch(:created_at, nil)
      
    end

    # Create a new Plan using the current client
    def new(data = {})
      Plan.new(@client, data)
    end

    # Overrides the JSON marshaller to only send the fields we want
    def to_json(options)
      {
          "id": self.id,
          "project": self.project,
          "project_id": self.project_id,
          "url": self.url,
          "name": self.name,
          "amount": self.amount,
          "currency": self.currency,
          "metadata": self.metadata,
          "interval": self.interval,
          "trial_period": self.trial_period,
          "return_url": self.return_url,
          "cancel_url": self.cancel_url,
          "sandbox": self.sandbox,
          "created_at": self.created_at,
      }.to_json
    end

    # Fills the object with data coming from the API
    # Params:
    # +data+:: +Hash+ of data coming from the API
    def fill_with_data(data)
      if data.nil?
        return self
      end
      if data.include? "id"
        self.id = data["id"]
      end
      if data.include? "project"
        self.project = data["project"]
      end
      if data.include? "project_id"
        self.project_id = data["project_id"]
      end
      if data.include? "url"
        self.url = data["url"]
      end
      if data.include? "name"
        self.name = data["name"]
      end
      if data.include? "amount"
        self.amount = data["amount"]
      end
      if data.include? "currency"
        self.currency = data["currency"]
      end
      if data.include? "metadata"
        self.metadata = data["metadata"]
      end
      if data.include? "interval"
        self.interval = data["interval"]
      end
      if data.include? "trial_period"
        self.trial_period = data["trial_period"]
      end
      if data.include? "return_url"
        self.return_url = data["return_url"]
      end
      if data.include? "cancel_url"
        self.cancel_url = data["cancel_url"]
      end
      if data.include? "sandbox"
        self.sandbox = data["sandbox"]
      end
      if data.include? "created_at"
        self.created_at = data["created_at"]
      end
      
      self
    end

    # Prefills the object with the data passed as parameters
    # Params:
    # +data+:: +Hash+ of data
    def prefill(data)
      if data.nil?
        return self
      end
      self.id = data.fetch(:id, self.id)
      self.project = data.fetch(:project, self.project)
      self.project_id = data.fetch(:project_id, self.project_id)
      self.url = data.fetch(:url, self.url)
      self.name = data.fetch(:name, self.name)
      self.amount = data.fetch(:amount, self.amount)
      self.currency = data.fetch(:currency, self.currency)
      self.metadata = data.fetch(:metadata, self.metadata)
      self.interval = data.fetch(:interval, self.interval)
      self.trial_period = data.fetch(:trial_period, self.trial_period)
      self.return_url = data.fetch(:return_url, self.return_url)
      self.cancel_url = data.fetch(:cancel_url, self.cancel_url)
      self.sandbox = data.fetch(:sandbox, self.sandbox)
      self.created_at = data.fetch(:created_at, self.created_at)
      
      self
    end

    # Get all the plans.
    # Params:
    # +options+:: +Hash+ of options
    def all(options = {})
      self.prefill(options)

      request = Request.new(@client)
      path    = "/plans"
      data    = {

      }

      response = Response.new(request.get(path, data, options))
      return_values = Array.new
      
      a    = Array.new
      body = response.body
      for v in body['plans']
        tmp = Plan.new(@client)
        tmp.fill_with_data(v)
        a.push(tmp)
      end

      return_values.push(a)
      

      
      return_values[0]
    end

    # Create a new plan.
    # Params:
    # +options+:: +Hash+ of options
    def create(options = {})
      self.prefill(options)

      request = Request.new(@client)
      path    = "/plans"
      data    = {
        "id" => @id, 
        "name" => @name, 
        "amount" => @amount, 
        "currency" => @currency, 
        "interval" => @interval, 
        "trial_period" => @trial_period, 
        "metadata" => @metadata, 
        "return_url" => @return_url, 
        "cancel_url" => @cancel_url
      }

      response = Response.new(request.post(path, data, options))
      return_values = Array.new
      
      body = response.body
      body = body["plan"]
      
      
      return_values.push(self.fill_with_data(body))
      

      
      return_values[0]
    end

    # Find a plan by its ID.
    # Params:
    # +plan_id+:: ID of the plan
    # +options+:: +Hash+ of options
    def find(plan_id, options = {})
      self.prefill(options)

      request = Request.new(@client)
      path    = "/plans/" + CGI.escape(plan_id) + ""
      data    = {

      }

      response = Response.new(request.get(path, data, options))
      return_values = Array.new
      
      body = response.body
      body = body["plan"]
      
      
      obj = Plan.new(@client)
      return_values.push(obj.fill_with_data(body))
      

      
      return_values[0]
    end

    # Save the updated plan attributes. This action won't affect subscriptions already linked to this plan.
    # Params:
    # +options+:: +Hash+ of options
    def save(options = {})
      self.prefill(options)

      request = Request.new(@client)
      path    = "/plans/" + CGI.escape(@id) + ""
      data    = {
        "name" => @name, 
        "trial_period" => @trial_period, 
        "metadata" => @metadata, 
        "return_url" => @return_url, 
        "cancel_url" => @cancel_url
      }

      response = Response.new(request.put(path, data, options))
      return_values = Array.new
      
      body = response.body
      body = body["plan"]
      
      
      return_values.push(self.fill_with_data(body))
      

      
      return_values[0]
    end

    # Delete a plan. Subscriptions linked to this plan won't be affected.
    # Params:
    # +options+:: +Hash+ of options
    def end(options = {})
      self.prefill(options)

      request = Request.new(@client)
      path    = "/plans/" + CGI.escape(@id) + ""
      data    = {

      }

      response = Response.new(request.delete(path, data, options))
      return_values = Array.new
      
      return_values.push(response.success)

      
      return_values[0]
    end

    
  end
end
