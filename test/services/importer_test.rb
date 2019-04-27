# frozen_string_literal: true

require 'test_helper'

class ImporterTest < Minitest::Test
  def test_accessor_methods_work
    assert Importer.new('./test/test_roster.csv').respond_to? :file
    assert Importer.new('./test/test_roster.csv').respond_to?(:file=)
    assert Importer.new('./test/test_roster.csv').respond_to? :data
    assert !Importer.new('./test/test_roster.csv').respond_to?(:data=)
  end

  def test_import_csv_data
    importer = Importer.new('./test/test_roster.csv')
    importer.import_csv_data
    CamperRegistration.delete_all
    Camp.delete_all
    Location.delete_all
    Branch.delete_all
    Camper.delete_all
    Parent.delete_all
    User.delete_all
  end
end
