Create a new Dart lesson project in the root directory with the following structure:

## Folder Structure

Create a folder with a descriptive snake_case name for the lesson (e.g., `variables`, `functions`, `classes`).
Inside, create two folders: `initial/` and `solution/`.

## Project Structure (for both initial/ and solution/)

Each folder must be a valid, runnable Dart project with:

1. **pubspec.yaml** - Include:
   - `name:` matching the lesson name
   - `description:` brief explanation of the lesson
   - `version: 1.0.0`
   - `environment:` with SDK constraint `'>=3.0.0 <4.0.0'`
   - `dev_dependencies:` with `test: ^1.25.0`

2. **bin/** folder - Contains the main Dart file(s)
   - Named after the lesson (e.g., `hello_world.dart`)
   - Contains the `main()` function

3. **test/** folder - Contains test file(s)
   - Named after the lesson with `_test.dart` suffix (e.g., `hello_world_test.dart`)
   - Uses `package:test` framework
   - Tests the output by running the bin file with `Process.run()`

## Content Guidelines

- **initial/**: Contains starter code with TODOs, incomplete implementations, or basic scaffolding for learners to complete
- **solution/**: Contains complete, working code that passes all tests
- Both folders should have identical `pubspec.yaml` files
- Tests should only be in the `solution/` folder (or both if testing is part of the lesson)

## Validation

After creating the lesson:

1. Run `dart pub get` in both `initial/` and `solution/` directories
2. Run `dart test` in the `solution/` directory to verify tests pass
3. Ensure the difference between `initial/` and `solution/` clearly demonstrates the learning objective

You will be provided with the lesson idea and code. Your job is to organize it into a properly structured, runnable Dart project following this format.
