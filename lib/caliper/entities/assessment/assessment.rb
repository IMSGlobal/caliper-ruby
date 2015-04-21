require_relative '../../entities/assignable/assignable_digital_resource'

#
#
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
# Represents an Assessment
#

module Caliper
  module Entities
    module Assessment

      class Assessment < Caliper::Entities::Assignable::AssignableDigitalResource

        attr_accessor :assessmentItems

        def initialize
          super
          @type = Caliper::Entities::Assignable::AssignableDigitalResourceType::ASSESSMENT
        end

      end
    end
  end
end
