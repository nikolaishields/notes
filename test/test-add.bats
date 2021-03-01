#!./test/libs/bats/bin/bats

load 'helpers'

setup() {
  setupNotesEnv
}

teardown() {
  teardownNotesEnv
}

notes="./notes"

@test "Should show new lines added" {
  echo line1 >> "$NOTES_DIRECTORY/note.md"
  echo line2 >> "$NOTES_DIRECTORY/note.md"
  assert_output $'line1\nline2'

  run $notes add note.md "new message"
  assert_success

  run $notes cat note.md
  assert_output $'line1\nline2\nnew message'
}

