json.extract! route,
:id,
:name,
:distance,
:created_at,
:updated_at,
:city_ids,
:created_at,
:updated_at
json.url route_url(route, format: :json)
