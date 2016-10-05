CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAILV4QFEMP53NLXJA',
    aws_secret_access_key: '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'
  }
  config.fog_directory = 'bettrcheddr'
end
