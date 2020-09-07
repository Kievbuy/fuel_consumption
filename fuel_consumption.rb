# frozen_string_literal: true

require_relative 'float'

class FuelConsumption
  def initialize(ship_mass, flight_plan)
    @ship_mass   = ship_mass
    @flight_plan = flight_plan
  end

  def perform
    result = 0
    residual_mass = @ship_mass

    @flight_plan.reverse.each do |route|
      cons = total_consumption(residual_mass, route[0], route[1])
      result += cons
      residual_mass += cons
    end
    result
  end

  private

  def total_consumption(mass, destination, gravity, consumption = 0)
    inner_consumption = destination == :launch ? launch_consumption(mass, gravity) : land_consumption(mass, gravity)

    return consumption.to_i if inner_consumption.zero? || inner_consumption.negative?

    consumption += inner_consumption
    total_consumption(inner_consumption, destination, gravity, consumption)
  end

  def launch_consumption(mass, gravity)
    (mass * gravity * 0.042 - 33).round_down
  end

  def land_consumption(mass, gravity)
    (mass * gravity * 0.033 - 42).round_down
  end
end
