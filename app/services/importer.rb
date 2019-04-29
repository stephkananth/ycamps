# frozen_string_literal: true

require 'roo'
require 'time'

class Importer
  attr_accessor :file
  attr_reader :data

  def initialize(file)
    @file = file
  end

  def import_csv_data
    # rows is 2D array
    rows = open_file_as_csv
    rows&.each do |row|
      create_user_and_parent_from(row)
      unless User.where(email: @user_email).empty?
        create_camper_from(row)
        create_branch_from(row)
        create_location_from(row)
        create_camp_from(row)
        create_registration_from(row)
      end
    end
  end

  private

  def open_file_as_csv
    return false if file.nil?

    @data = []
    data = Roo::Spreadsheet.open(file, extension: :csv)
    data.each_with_pagename do |_name, sheet|
      data.last_row.times do |i|
        @data << sheet.row(i + 1) unless i.zero?
      end
    end
    @data
  end

  def create_user_and_parent_from(data)
    read_data(data)
    unless @user_email.blank?
      @user = User.new
      @user.email = @user_email
      @user.password = 'secret123'
      @user.password_confirmation = 'secret123'
      @user.first_name = @user_first
      @user.last_name = @user_last
      @user.role = 'parent'
      save_user_and_parent if User.not_in_system?(@user)
    end
  end

  def save_user_and_parent
    @user.save!
    @parent = Parent.new(user: User.where(email: @user_email).first, active: true)
    @parent.save!
  end

  def create_camper_from(data)
    read_data(data)
    @camper = Camper.new
    @camper.parent = Parent.where(user: User.where(email: @user_email).first).first
    @camper.first_name = @camper_first
    @camper.last_name = @camper_last
    @camper.active = true
    @camper.save! if Camper.not_in_system?(@camper)
  end

  def create_branch_from(data)
    read_data(data)
    @branch = Branch.new(name: @branch_name)
    @branch.save! if Branch.not_in_system?(@branch)
  end

  def create_location_from(data)
    read_data(data)
    @location = Location.new(branch: @branch, name: @location_name)
    @location.save! if Location.not_in_system?(@location)
  end

  def create_camp_from(data)
    read_data(data)
    @camp = Camp.new
    @camp.location = Location.where(name: @location_name).first
    @camp.name = @camp_name
    @camp.program = @camp_program
    @camp.start_date = @camp_start
    @camp.end_date = @camp_end
    @camp.active = true
    @camp.save! if Camp.not_in_system?(@camp)
  end

  def create_registration_from(data)
    read_data(data)
    @registration = CamperRegistration.new
    @registration.camp = @camp
    @registration.camper = @camper
    @registration.save! if CamperRegistration.not_in_system?(@camp, @camper)
  end

  def read_data(data)
    @camper_first = data[2]
    @camper_last = data[3]
    @branch_name = data[23]
    @location_name = data[24]
    @camp_program = data[25]
    @camp_start = Date.strptime(data[31], '%m/%d/%Y')
    @camp_end = Date.strptime(data[32], '%m/%d/%Y')
    @camp_name = data[30]
    @user_first = data[42]
    @user_last = data[43]
    @user_email = data[44]
    # puts "camper.first_name = #{@camper_first}"
    # puts "camper.last_name = #{@camper_last}"
    # puts "branch.name = #{@branch_name}"
    # puts "location.name = #{@location_name}"
    # puts "camp.program = #{@camp_program}"
    # puts "camp.start = #{@camp_start}"
    # puts "camp.end = #{@camp_end}"
    # puts "camp.name = #{@camp_name}"
    # puts "user.first_name = #{@user_first}"
    # puts "user.last_name = #{@user_last}"
    # puts "user.email = #{@user_email}"
    # puts ' '
  end
end
