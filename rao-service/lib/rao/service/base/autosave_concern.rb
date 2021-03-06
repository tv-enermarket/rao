module Rao
  module Service
    module Base::AutosaveConcern
      extend ActiveSupport::Concern

      if respond_to?(:class_methods)
        class_methods do
          def call!(*args)
            new(*args).autosave!.perform
          end
        end
      else
        module ClassMethods
          def call!(*args)
            new(*args).autosave!.perform
          end
        end
      end

      def autosave?
        !!@options[:autosave]
      end

      def autosave!
        @options[:autosave] = true
        self
      end
    end
  end
end
