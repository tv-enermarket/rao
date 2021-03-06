module Rao
  module Component
    module ResourceTable::ThumbnailConcern
      extend ActiveSupport::Concern

      def thumbnail(name, options = {}, &block)
        options.reverse_merge!(render_as: :thumbnail, variant_options: Rao::Component::Configuration.image_variant_options[:resource])
        row(name, options, &block)
      end
    end
  end
end