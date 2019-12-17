# encoding: utf-8
module CarrierWave
  module Jobs
    class StoreAssetJob < ActiveJob::Base
      include CarrierWave::Jobs::Base

      def perform(*args)
        record = super(*args)

        if record && record.send(:"#{column}_tmp")
          record.send :"process_#{column}_upload=", true
          record.send :"#{column}_cache=", record.send(:"#{column}_tmp")
          record.send :"#{column}_tmp=", nil
          record.send :"#{column}_processing=", false if record.respond_to?(:"#{column}_processing")
          record.save!
        else
          when_not_ready
        end
      end
    end
  end
end
