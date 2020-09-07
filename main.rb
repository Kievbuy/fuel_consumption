# frozen_string_literal: true

require_relative 'fuel_consumption'

puts FuelConsumption.new(28_801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]).perform
puts FuelConsumption.new(14_606, [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]]).perform
puts FuelConsumption.new(75_432, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711], [:launch, 3.711],
                                  [:land, 9.807]]).perform
