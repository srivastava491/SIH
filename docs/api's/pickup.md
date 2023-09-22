# Get /api/pickups

Returns all pickups which are assigned to user or not assigned to anyone

Example: /api/signup

Input: (OPTIONAL) => Header.userId

Output: 
```json
[
  {
    "_id": "650cd5cc64a4007f303e8714",
    "soldItemId": "650cd1284161f16a983a5a75",
    "status": "yet to pickup",
    "__v": 0,
    "userAssigned": "650234dfae5ea437c88813b4"
  }
]
```

### POST /api/pickups/add

Adds a new pickup

Example: /api/pickups/add

Input: 
```json
{
  "soldItemId": "650cd1284161f16a983a5a75",
  "userAssigned": "650234dfae5ea437c88813b4", // OPTIONAL
  "status": "yet to pickup" // OPTIONAL
}
```

Output: 
```json
{
  "_id": "650cd5cc64a4007f303e8714",
  "soldItemId": "650cd1284161f16a983a5a75",
  "status": "yet to pickup",
  "__v": 0,
  "userAssigned": "650234dfae5ea437c88813b4"
}
```

### PUT /api/pickups/:id

Updates a pickup

Example: /api/pickups/650cd5cc64a4007f303e8714

Input:
```json
{
  "status": "Success"
}
```

Output: 
```json
{
  "_id": "650cd5cc64a4007f303e8714",
  "soldItemId": "650cd1284161f16a983a5a75",
  "status": "Success",
  "__v": 0,
  "userAssigned": "650234dfae5ea437c88813b4"
}
```