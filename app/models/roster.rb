class Roster < ApplicationRecord
  mount_uploader :file, RosterUploader

  after_validation :import_data, on: :create

  def import_data
    importer = Importer.new(self.file)
    importer.import_csv_data
  end
end
