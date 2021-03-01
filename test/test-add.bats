
#!./test/libs/bats/bin/bats

load 'helpers'

setup() {
  setupNotesEnv
}

teardown() {
  teardownNotesEnv
}

notes="./notes"

@test "Should show created note" {
  echo line1 >> "$NOTES_DIRECTORY/note.md"
  echo line2 >> "$NOTES_DIRECTORY/note.md"
  run $notes cat note.md

  assert_success
  assert_output $'line1\nline2'
}

