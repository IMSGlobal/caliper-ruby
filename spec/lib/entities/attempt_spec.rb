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

require 'spec_helper'

describe Caliper::Entities::Assign::Attempt do

  subject do
    described_class.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/users/554433/attempts/1',
      assignable: Caliper::Entities::Resource::Assessment.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1'
      ),
      assignee: Caliper::Entities::Agent::Person.new(
        id: 'https://example.edu/users/554433'
      ),
      count: 1,
      dateCreated: '2016-11-15T10:05:00.000Z',
      startedAtTime: '2016-11-15T10:05:00.000Z',
      endedAtTime: '2016-11-15T10:55:30.000Z',
      duration: 'PT50M30S'
    )
  end

  include_examples 'validation against common fixture', 'caliperEntityAttempt.json', optimize: :none
end
