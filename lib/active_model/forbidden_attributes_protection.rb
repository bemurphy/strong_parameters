module ActiveModel
  class ForbiddenAttributes < StandardError
  end

  module ForbiddenAttributesProtection
    class << self
      attr_accessor :always_protect_mass_assignment
    end

    def sanitize_for_mass_assignment(*options)
      new_attributes = options.first
      if always_protect_mass_assignment? && !new_attributes.respond_to?(:permitted?)
        raise ActiveModel::ForbiddenAttributes
      elsif !new_attributes.respond_to?(:permitted?) || new_attributes.permitted?
        super
      else
        raise ActiveModel::ForbiddenAttributes
      end
    end

    private

      def always_protect_mass_assignment?
        !! ActiveModel::ForbiddenAttributesProtection.always_protect_mass_assignment
      end
  end
end
