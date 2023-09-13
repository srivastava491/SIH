Setup USER 
Fixes #2

### /api/signup

METHOD: POST

body:
```json
{
    "email": "email",
    "name": "username",
    "password": "password"
}
```

> TEST: 
Json Body: 
```json
{
  "email": "test@gmail.com",
  "name": "test",
  "password": "haflkndaskjlc"
}
```

returned: 
```json
{
  "name": "test",
  "email": "test@gmail.com",
  "password": "$2a$08$.04vayGkfPMlq0MbgPNaJ.X1pq6WSZPEinXse1Sd7WX.2RgqGewxi",
  "type": "user",
  "_id": "650234dfae5ea437c88813b4",
  "__v": 0
}
```

Stored in db as: 
```json
{
    "_id":"650234dfae5ea437c88813b4"
    ,"name":"test",
    "email":"test@gmail.com",
    "password":"$2a$08$.04vayGkfPMlq0MbgPNaJ.X1pq6WSZPEinXse1Sd7WX.2RgqGewxi",
    "type":"user",
    "__v":"0"
}
```



### /api/signin

METHOD: POST

body:
```json
{
    "email": "email",
    "password": "password"
}
```

sign in return:
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MDIzNGRmYWU1ZWE0MzdjODg4MTNiNCIsImlhdCI6MTY5NDY0MzU2NX0.i1OmAldmVG5qxoI5ZhmXMyT9j2f-lN2N9i6KMRPBW6M",
  "_id": "650234dfae5ea437c88813b4",
  "name": "test",
  "email": "test@gmail.com",
  "password": "$2a$08$.04vayGkfPMlq0MbgPNaJ.X1pq6WSZPEinXse1Sd7WX.2RgqGewxi",
  "type": "user",
  "__v": 0
}
```


### /tokenIsValid

METHOD: POST

header:
```
x-auth-token: token
```

example: 
```
x-auth-token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MDIzNGRmYWU1ZWE0MzdjODg4MTNiNCIsImlhdCI6MTY5NDY0MzU2NX0.i1OmAldmVG5qxoI5ZhmXMyT9j2f-lN2N9i6KMRPBW6M
```

output:
```json
true
```


