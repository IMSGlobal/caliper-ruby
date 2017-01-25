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

require_relative 'digital_resource'
require_relative '../entity_type'

#
# Representation of a message.
#
module Caliper
  module Entities
    module Resource
      class Message < Caliper::Entities::Resource::DigitalResource

        caliper_type Caliper::Entities::EntityType::MESSAGE

        caliper_property :attachments, default: []
        caliper_property :body
        caliper_property :replyTo

      end
    end
  end
end