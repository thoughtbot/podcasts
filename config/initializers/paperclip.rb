if Rails.env.test?
  PAPERCLIP_STORAGE_OPTIONS = {}
else
  PAPERCLIP_STORAGE_OPTIONS = {
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/s3.yml"
  }
end
