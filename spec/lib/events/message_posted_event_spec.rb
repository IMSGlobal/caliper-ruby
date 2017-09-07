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

describe Caliper::Events::MessageEvent do
  subject do
    described_class.new(
      action: Caliper::Actions::POSTED,
      actor: actor,
      edApp: ed_app,
      eventTime: '2016-11-15T10:15:00.000Z',
      group: group,
      id: 'urn:uuid:0d015a85-abf5-49ee-abb1-46dbd57fe64e',
      membership: membership,
      object: object,
      session: session
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:ed_app) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu/forums',
      version: 'v2'
    )
  end

  let(:group) do
    Caliper::Entities::LIS::CourseSection.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1',
      courseNumber: 'CPS 435-01',
      academicSession: 'Fall 2016'
    )
  end

  let(:membership) do
    Caliper::Entities::LIS::Membership.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/rosters/1',
      member: actor,
      organization: group,
      roles: [
        Caliper::Entities::LIS::Role::LEARNER
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2016-08-01T06:00:00.000Z'
    )
  end

  let(:object) do
    Caliper::Entities::Resource::Message.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/forums/2/topics/1/messages/2',
      creators: [ actor ],
      body: 'Are the Caliper Sensor reference implementations production-ready?',
      dateCreated: '2016-11-15T10:15:00.000Z',
      isPartOf: Caliper::Entities::Resource::Thread.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/forums/2/topics/1',
        name: 'Caliper Adoption',
        isPartOf: Caliper::Entities::Resource::Forum.new(
          id: 'https://example.edu/terms/201601/courses/7/sections/1/forums/2',
          name: 'Caliper Forum'
        )
      )
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2016-11-15T10:00:00.000Z'
    )
  end

  include_examples 'validation against common fixture', 'caliperEventMessagePosted.json', excluding: 'creators'
end