json.extract! vehicle,
:id,
:identifier,
:current_location,
:distance_traveled,
:fuel_consumption,
:fuel_consumed,
:is_available ,
:city_id,
:route_id,
:created_at,
:updated_at

json.url vehicle_url(vehicle, format: :json)
