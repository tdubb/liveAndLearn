# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],     # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'], # required
    :region                 => ENV['S3_REGION'],                  # optional, defaults to 'us-east-1'
  }

  config.fog_public     = true                                   # optional, defaults to true
  # config.fog_attributes = { 'Cache-Control'=>'max-age=315576000' }  # optional, defaults to {}
  config.fog_directory  = ENV['AWS_BUCKET']
end
