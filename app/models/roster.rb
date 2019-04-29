class Roster < ApplicationRecord
  mount_uploader :file, RosterUploader

  # validations
  # this calls the import data function when a new roster is entered into the system
  after_validation :import_data, on: :create

  # public methods
  def import_data
    importer = Importer.new(self.file)
    importer.import_csv_data
  end
end
