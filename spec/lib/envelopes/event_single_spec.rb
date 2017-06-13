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

describe Caliper::Request::Envelope do

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433'
    )
  end

  let(:object) do
    Caliper::Entities::Resource::Assessment.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1',
      name: 'Quiz One',
      dateToStartOn: '2016-11-14T05:00:00.000Z',
      dateToSubmit: '2016-11-18T11:59:59.000Z',
      maxAttempts: 2,
      maxSubmits: 2,
      maxScore: 25.0,
      version: '1.0'
    )
  end

  let(:attempt) do
    Caliper::Entities::Assign::Attempt.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/users/554433/attempts/1',
      assignee: actor,
      assignable: object,
      count: 1,
      dateCreated: '2016-11-15T10:15:00.000Z',
      startedAtTime: '2016-11-15T10:15:00.000Z'
    )
  end

  let(:ed_app) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu',
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
      organization: Caliper::Entities::LIS::CourseSection.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1',
      ),
      roles: [
        Caliper::Entities::LIS::Role::LEARNER
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2016-08-01T06:00:00.000Z'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2016-11-15T10:00:00.000Z'
    )
  end

  let(:sensor_id) { 'https://example.edu/sensors/1' }

  let(:sensor_data) do
    Caliper::Events::AssessmentEvent.new(
      action: Caliper::Actions::STARTED,
      actor: actor,
      edApp: ed_app,
      eventTime: '2016-11-15T10:15:00.000Z',
      generated: attempt,
      group: group,
      id: 'urn:uuid:c51570e4-f8ed-4c18-bb3a-dfe51b2cc594',
      membership: membership,
      object: object,
      session: session
    )
  end

  include_examples 'payload validation against common fixture', 'caliperEnvelopeEventSingle.json'
end
