# Rumbl

## TODO

- add login/logout links to the header:
  - it should be dynamic: if user is not logged in - show "login", if user is logged in - show "logout"
 
- add register link to login page:
  - somewhere near the form

- implement logout:
  - link to logout (method DELETE)
  - add route for logout (delete)
  - "delete" action in AuthController
  - put_session(:current_user, nil)

- password hashing:
  - delete password column from users
  - add password_hash column to users
  - use BCrypt for making hash from password and for checking the password
```sh
    iex(2)> hash = Bcrypt.hash_pwd_salt("test1234")
    "$2b$12$qmK0pMEtUQquXiBi66R26OW8WB5dtrvWc3jOB5Efl9prKjQCdC2n."
    iex(3)> Bcrypt.verify_pass("qwert", hash)
    false
    iex(4)> Bcrypt.verify_pass("test1234", hash)
```
