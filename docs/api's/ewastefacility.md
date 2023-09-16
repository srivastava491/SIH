# api's are changed
### POST /api/ewaste_facilities

> Create a new ewaste facility

```json
{
  "name": "Demo Facility",
  "coordinates": {
    "type": "Point",
    "coordinates": [23.543, 34.534]
  },
  "description": "This is a demo ewaste facility.",
  "type": "Recycling Center",
  "location": "Demo City",
  "reviews": []
}
```

output:
```json
{
  "id": "65033c939a926bd31b1d73b4"
}
```

### GET /api/ewaste_facilities

> Get all ewaste facilities

input: none

output: 
```json
[
  {
    "coordinates": {
      "type": "Point",
      "coordinates": [
        23.543,
        34.534
      ]
    },
    "_id": "65033c939a926bd31b1d73b4",
    "name": "Demo Facility",
    "description": "This is a demo ewaste facility.",
    "type": "Recycling Center",
    "location": "Demo City",
    "reviews": [],
    "__v": 0
  }
]
```

### GET /api/ewaste_facilities/:id

> Get a single ewaste facility, searched by id

input: none, replace :id with id of ewaste facility
> example: /api/ewaste_facilities/65033c939a926bd31b1d73b4

output:
```json
{
  "coordinates": {
    "type": "Point",
    "coordinates": [
      23.543,
      34.534
    ]
  },
  "_id": "65033c939a926bd31b1d73b4",
  "name": "Demo Facility",
  "description": "This is a demo ewaste facility.",
  "type": "Recycling Center",
  "location": "Demo City",
  "reviews": [],
  "__v": 0
}
```

### PUT /api/ewaste_facilities/:id

> Update a single ewaste facility, searched by id

input: replace :id with id of ewaste facility
> example: /api/ewaste_facilities/65033c939a926bd31b1d73b4

```json
{
  "name": "update Demo Facility",
  "coordinates": {
    "type": "Point",
    "coordinates": [23.543, 34.534]
  },
  "description": "This is a updated demo ewaste facility.",
  "type": "new Recycling Center",
  "location": "Demo City",
  "reviews": []
}
```

ouput:
```json
{
  "id": "65033c939a926bd31b1d73b4",
  "message": "Ewaste facility updated successfully"
}
```

database:
```json
{
  "coordinates": {
    "type": "Point",
    "coordinates": [
      23.543,
      34.534
    ]
  },
  "_id": "65033c939a926bd31b1d73b4",
  "name": "update Demo Facility",
  "description": "This is a updated demo ewaste facility.",
  "type": "new Recycling Center",
  "location": "Demo City",
  "reviews": [],
  "__v": 0
}
```

### DELETE /api/ewaste_facilities/:id

> Delete a single ewaste facility, searched by id

input: none, replace :id with id of ewaste facility
> example: /api/ewaste_facilities/65033c939a926bd31b1d73b4

output:
```json
{
  "message": "Ewaste facility deleted successfully"
}
```

database: none

