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

describe Caliper::Entities::Resource::AssessmentItem do

  subject do
    described_class.new(
      id:     'https://example.edu/terms/201601/courses/7/sections/1/assess/1/items/3',
      dateCreated: '2016-08-01T06:00:00.000Z',
      datePublished: '2016-08-15T09:30:00.000Z',
      isTimeDependent: false,
      maxScore: 1.0,
      maxSubmits: 2,
      isPartOf: Caliper::Entities::Resource::Assessment.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1'
      ),
      extensions: {
        correctResponse: 'yes',
        questionText: 'Is a Caliper SoftwareApplication a subtype of Caliper Agent?',
        questionType: 'Dichotomous'
      }
    )
  end

  include_examples 'validation against common fixture', 'caliperEntityAssessmentItemExtended.json'
end
