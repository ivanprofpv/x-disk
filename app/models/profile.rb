class Profile < ApplicationRecord
  belongs_to :user

  has_many_attached :attachments

  validates :attachments, content_type: { 
    in: ['application/zip',  
         'application/vnd.openxmlformats-officedocument.wordprocessingml.document',          
         'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
         'application/vnd.ms-word'
        ], 
        message: 'must be a zip, docx or xlsx' 
    },  size: { less_than: 4.megabytes, message: 'file is too large, max size file - 4MB' }
end
