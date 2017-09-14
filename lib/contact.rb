#!/usr/bin/env ruby

module ContactList
  class Contact
    @@contact_list = {}

    attr_reader :phone, :email, :address
    attr_accessor :first_name, :last_name, :job_title, :company, :contact_type

    def initialize(attributes)
      @first_name = attributes.fetch(:first_name)
      @last_name = attributes.fetch(:last_name)
      @job_title = attributes.fetch(:job_title)
      @company = attributes.fetch(:company)
      @contact_type = attributes.fetch(:contact_type)
      @phone = {}
      @email = {}
      @address = {}
    end

    def add_phone(number, type="default")
      @phone[type] = number
    end

    def add_email(email, type="default")
      @email[type] = email
    end

    def add_address(address, type="default")
      @address[type] = address
    end

    def save
      @@contact_list[@first_name + " " + @last_name] = self
    end

    def self.all
      @@contact_list
    end

    def self.find(full_name)
      if @@contact_list.has_key?(full_name)
        return @@contact_list[full_name]
      else
        return "Can't find contact"
      end
    end
  end
end
