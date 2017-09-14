#!/usr/bin/env ruby

module ContactList
  class Contact
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
  end
end
