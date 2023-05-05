class Userfile < ApplicationRecord
  belongs_to :profile
  has_one_attached :attachment

  scope :total_space_self_user_method, -> { ActiveStorage::Attachment.joins(:blob).where(record: self).sum(:byte_size).to_i }

  validates :attachment, content_type: {
    in: ['application/zip',
         'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
         'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
         'application/vnd.ms-word'
        ],
        message: 'must be a zip, docx or xlsx'
    },  size: { less_than: 4.megabytes, message: 'file is too large, max size file - 4MB' }
end
