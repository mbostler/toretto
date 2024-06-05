# frozen_string_literal: true

def random_side
  FFaker::Random.rand(0..6)
end
FactoryBot.define do
  factory :domino do
    lhs { random_side }
    rhs { random_side }
    initialize_with { new(lhs, rhs) }

    trait :non_double do
      callback = ->(domino) { domino.rhs = random_side until domino.lhs != domino.rhs }

      after(:build, &callback)
      after(:stub, &callback)
    end

    trait :double do
      callback = ->(domino) { domino.rhs = domino.lhs }

      after(:build, &callback)
      after(:stub, &callback)
    end
  end
end
