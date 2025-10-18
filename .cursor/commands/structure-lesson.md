Generate a JSON configuration for a Dart lesson that defines which files are displayed to users in the course interface.

## Input

You will be provided with a lesson folder name (e.g., `hello_world`, `variables`, `functions`).

## Output Format

Output the JSON configuration in a markdown code block that can be easily copied and pasted. Do NOT create a file - just output it in chat as markdown.

## JSON Structure

```json
{
  "code": {
    "repo": "best-dart",
    "files": [
      { "name": "pubspec.yaml" },
      { "name": "bin/lesson_name.dart", "default": true },
      { "name": "test/lesson_name_test.dart", "hidden": true }
    ],
    "initialDirectory": "lesson_name/initial",
    "solutionDirectory": "lesson_name/solution"
  }
}
```

## Field Guidelines

- **repo**: Always `"best-dart"`
- **files**: Array of file objects in the lesson
  - `name`: Relative path from the initial/solution directory
  - `default`: Only ONE file should have `"default": true` - this is the main file users will edit
  - `hidden`: Files marked `"hidden": true` won't be shown initially (typically test files)
- **initialDirectory**: Path to the initial code (format: `lesson_name/initial`)
- **solutionDirectory**: Path to the solution code (format: `lesson_name/solution`)

## File Selection Rules

1. **Always include**: `pubspec.yaml` (no flags)
2. **Main code file**: Mark with `"default": true` (typically the bin file)
3. **Test files**: Mark with `"hidden": true` (unless the lesson is specifically about testing)
4. **Additional files**: Include any other relevant files without flags

## Notes

- This command is typically run after creating the lesson structure
- Only one file can be marked as `default`
- List files in logical order: pubspec.yaml, then main files, then test files
