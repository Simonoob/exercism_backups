class LocomotiveEngineer
  def self.generate_list_of_wagons(*ids)
    raise ArgumentError unless ids.all? Integer
    ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second = each_wagons_id
    id_of_1 = each_wagons_id.find{|id|id==1}
    [id_of_1, *missing_wagons, *each_wagons_id.slice(2..-1).filter{|id|id != 1}, first, second]
  end

  def self.add_missing_stops(routing_hash, **kwargs)
    {
      **routing_hash,
      stops: kwargs.values,
    }
  end

  def self.extend_route_information(route, more_route_information)
    {
      **route,
      **more_route_information
    }
  end
end
