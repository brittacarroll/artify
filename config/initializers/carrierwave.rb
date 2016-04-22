CarrierWave.configure do |config|
  if !Rails.env.test?
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secrete_access_key: ENV["AWS_SECRETE_ACCESS_KEY"]
    }

    config.fog_directory = ENV["S3_BUCKET"]
  end
end
