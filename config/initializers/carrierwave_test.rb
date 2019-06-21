if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  # make sure our uploader is auto-loaded
  # CourseImageUploader
  Dir[Rails.root.join('uploaders', '**', '*.rb')].each { |f| require f }

  # use different dirs when testing
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/tmp"
      end

      def store_dir
        "#{Rails.root}/spec/tmp/assets/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end
