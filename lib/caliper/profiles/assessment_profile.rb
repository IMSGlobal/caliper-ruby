##
# This file is part of IMS Caliper Analytics™ and is licensed to
# IMS Global Learning Consortium, Inc. (http://www.imsglobal.org)
# under one or more contributor license agreements.  See the NOTICE
# file distributed with this work for additional information.
#
# IMS Caliper is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# IMS Caliper is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with this program. If not, see http://www.gnu.org/licenses/.

require_relative './profile'

#
# Assessment Profile.
#
module Caliper
  module Profiles
    module AssessmentActions
      PAUSED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Paused"
      RESTARTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Restarted"
      STARTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Started"
      SUBMITTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Submitted"
    end

    class AssessmentProfile < Caliper::Profiles::Profile

      attr_accessor :key, # String
        :lookup # hash of AssessmentActions

      # whether object if of type DigitalResource
      def validate_object(object)
        if (object.is_a? DigitalResource)
          return object
        else
          fail 'Object must be of type DigitalResource'
        end
      end
    end
  end
end