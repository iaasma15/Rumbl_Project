# Rumbl

## TODO

- move the form to the "form.heex" template, and use this template in "new" and "edit" actions. Google the phoenix syntax for rendering templates
- CSS, HTML - your ideas
- pass button name as a variable (like changeset, action)

- CRUD for product improve tables/text

- Improve registration changeset:

  - password and confirm should be the same (use custom ecto validation, RTM)
  - check passwor complexity (optional) (use custom ecto validation, RTM)

- Implemet AutheticationController:
  - login form
  - authenticate, just redirect to "/" with messages "Success!" or error "either username or password is incorrect"
  - (optional) read about sessions and cookies in Phoenix
