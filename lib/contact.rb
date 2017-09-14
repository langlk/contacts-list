#!/usr/bin/env ruby

module ContactList
  class Contact
    attr_accessor :first_name, :last_name, :job_title, :company, :contact_type, :phone, :email, :address

    def initialize(attributes)
      @first_name = attributes.fetch(:first_name)
      @last_name = attributes.fetch(:last_name)
      @job_title = attributes.fetch(:job_title)
      @company = attributes.fetch(:company)
      @contact_type = attributes.fetch(:contact_type)
      @phone = ""
      @email = ""
      @address = ""
    end
  end
end
