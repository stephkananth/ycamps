require 'test_helper'

class ImporterTest < Minitest::Test
  def test_accessor_methods_work
    assert Importer.new('./test/student_data.csv').respond_to? :file
    assert Importer.new('./test/student_data.csv').respond_to?(:file=)
    assert Importer.new('./test/student_data.csv').respond_to? :stu_data
    assert !Importer.new('./test/student_data.csv').respond_to?(:stu_data=)
    assert Importer.new('./test/student_data.csv').respond_to? :students
    assert Importer.new('./test/student_data.csv').respond_to?(:students=)
  end

  def test_import_csv_data_as_students
    importer = Importer.new('./test/student_data.csv')
    importer.import_csv_data_as_students
    assert_equal 3, importer.students.count
    assert_equal "Ryan", importer.students.first.first_name
    assert_equal "Novak", importer.students.last.last_name
    assert_equal "abbey@example.com", importer.students[1].email
  end
end