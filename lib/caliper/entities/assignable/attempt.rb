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

require_relative '../entity'
require_relative '../entity_type'
require_relative '../generatable'

#
#  Attempt entity on an Assignable.
#
module Caliper
  module Entities
    module Assignable
      class Attempt < Entity
        include Caliper::Entities::Generatable

        attr_accessor :assignable, :actor, :count, :startedAtTime, :endedAtTime, :duration

        def initialize
          super
          @type = Caliper::Entities::EntityType::ATTEMPT
          @startedAtTime = nil
          @endedAtTime = nil
          @duration = nil
        end

      end
    end
  end
end