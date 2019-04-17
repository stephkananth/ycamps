class Importer
  attr_accessor :file
  attr_reader :stu_data
  attr_accessor :students

  def initialize(file)
    @file = file
    @students = Array.new
  end

  def import_csv_data_as_students
    # rows is 2D array
    rows = open_file_as_csv
    unless rows == false
      rows.each do |row|
        add_student(row)
      end
    end
    return students
  end

  private

  def open_file_as_csv
    return false if file.nil?
    @stu_data = Array.new
    student_data = Roo::Spreadsheet.open(file, extension: :csv)
    student_data.each_with_pagename do |name, sheet|
      student_data.last_row.times do |i|
        # rows start at 1 but array starts at 0
        # row 1 (array[0]) is the header that we don't want
        @stu_data << sheet.row(i + 1) unless i == 0
      end
    end
    @stu_data
  end

  def read_data(data)
    @last_name = data[0]
    @first_name = data[1]
    @email = data[2]
    # puts "#{@last_name}, #{@first_name}, #{@email}"
  end

  def add_student(data)
    read_data(data)
    student = Student.new(@last_name, @first_name, @email)
    students << student
  end

end