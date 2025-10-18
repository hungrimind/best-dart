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
   - **IMPORTANT**: The same test file must be in BOTH `initial/` and `solution/` folders

## Content Guidelines

- **initial/**: Contains starter code with TODOs, incomplete implementations, or basic scaffolding for learners to complete
- **solution/**: Contains complete, working code that passes all tests
- Both folders should have identical `pubspec.yaml` and `test/` files
- Tests are copied from `solution/test/` to `initial/test/` to provide immediate feedback to learners

## Workflow (Test-Driven Learning)

The lesson follows a test-driven approach:
1. Create the solution code first (complete implementation)
2. Write comprehensive tests that validate the solution
3. Create the initial starter code (incomplete/empty implementation)
4. Copy the test file to the initial folder
5. Verify tests fail meaningfully on initial code
6. Learners will see failing tests → write code → see tests pass

## Validation

After creating the lesson:

1. Run `dart pub get` in both `initial/` and `solution/` directories
2. **Copy the test file** from `solution/test/` to `initial/test/` (identical test files in both directories)
3. Run `dart test` in the `initial/` directory to verify tests **FAIL** with clear, helpful error messages
4. Run `dart test` in the `solution/` directory to verify tests **PASS**
5. Ensure the difference between `initial/` and `solution/` clearly demonstrates the learning objective

You will be provided with the lesson idea and code. Your job is to organize it into a properly structured, runnable Dart project following this format.
