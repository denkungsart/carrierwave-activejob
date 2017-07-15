# encoding: utf-8
module CarrierWave
  module Jobs
    class ProcessAssetMixin < ActiveJob::Base
      include CarrierWave::Jobs::Base

      def perform(*args)
        record = super(*args)

        if record && record.send(:"#{column}").present?
          record.send(:"process_#{column}_upload=", true)
          if record.send(:"#{column}").recreate_versions! && record.respond_to?(:"#{column}_processing")
            record.update_attribute :"#{column}_processing", false
          end
        else
          when_not_ready
        end
      end
    end
  end
end
