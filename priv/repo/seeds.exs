# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

[
  %User{id: "1", name: "simon", username: "simonangatia"},
  %User{id: "2", name: "eric", username: "ericochieng"},
  %User{id: "3", name: "moses", username: "mose"},
  %User{id: "4", name: "christine", username: "chris"},
  %User{id: "5", name: "edward", username: "edwards"}
]
