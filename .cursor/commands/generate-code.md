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

### Code Simplicity

- **Keep code SIMPLE**: Both `initial/` and `solution/` code should focus on the core concept being taught
- **Starting code**: Contains starter code with incomplete implementations, or basic scaffolding for learners to complete
- **Solution code**: Contains complete, working code that demonstrates the lesson concept
- **All code must be runnable**: Both folders should include complete `main()` functions and all necessary code
- **NO test infrastructure in code**: The code should NOT include any test helpers, test utilities, or code written specifically to make testing easier
- **Do NOT add complexity for testing**: Never make the code more complex just to make testing easier. The code should be as simple as possible while teaching the concept
- Both folders should have identical `pubspec.yaml` and `test/` files
- Tests are copied from `solution/test/` to `initial/test/` to provide immediate feedback to learners

### Test Quality

- **Focus on core functionality only**: Write tests that validate the core learning objective, not every possible edge case or variation
- **Keep tests minimal**: Typically aim for 3-7 tests total. Test representative examples rather than exhaustive coverage
- **Test the concept, not every instance**: If the lesson requires handling multiple similar cases, test 1-2 representative examples rather than testing every single case
- **Tests must NOT require code modifications**: The solution code should pass tests without any modifications - tests should adapt to the code, not the other way around
- **Helpful test names**: Each test should have a descriptive name that clearly indicates what aspect is being tested and what would be wrong if it fails
- **Test reasons/explanations**: Include `reason` parameters (or descriptive comments) in tests that explain what is wrong to the end user when tests fail
- **Tests validate the learning objective**: Tests should check that the core concept is correctly implemented, not every possible variation
- **Tests fail meaningfully**: Tests should fail on `initial/` code with clear, helpful error messages that guide learners
- **Tests pass on solution**: All tests should pass on `solution/` code to confirm the implementation is correct
- **Avoid over-testing**: Don't test every single input value, edge case, or variation. Focus on demonstrating the core concept works correctly

## Workflow (Test-Driven Learning)

The lesson follows a test-driven approach:

1. **Create the solution code first**: Write complete, simple implementation focused on the core concept
   - Keep it minimal - only what's needed to teach the lesson
   - Ensure it has a complete `main()` function and is runnable
   - Do NOT add complexity for testing purposes

2. **Write focused, minimal tests**: Create tests that validate the core functionality
   - Test representative examples focusing on core functionality (typically 3-7 tests total)
   - Use descriptive test names that explain what's being tested
   - Include `reason` parameters or comments explaining what's wrong if tests fail
   - Tests should work with the solution code as-is (no modifications needed)
   - **Do NOT test every single case or edge case** - focus only on demonstrating the core learning objective works
   - Test 1-2 representative examples rather than exhaustive coverage

3. **Create the initial starter code**: Write incomplete/empty implementation
   - Remove or stub out key parts that demonstrate the learning objective
   - **Include all code that is NOT part of the learning objective**: If the lesson is about loops, include all the code inside the loop. If the lesson is about conditionals, include all setup code. Only remove/stub the core concept being taught.
   - Keep the same structure and simplicity as the solution
   - **Avoid giving away method names or implementation details in comments**: Comments should describe WHAT needs to be done, not HOW to do it. Don't mention specific method names (e.g., `.add()`, `.remove()`) or implementation details that would make the solution obvious

4. **Copy the test file** from `solution/test/` to `initial/test/` (identical test files in both directories)

5. **Verify tests fail meaningfully** on initial code with clear, helpful error messages

6. Learners will see failing tests → write code → see tests pass

## Validation

After creating the lesson:

1. Run `dart pub get` in both `initial/` and `solution/` directories
2. **Copy the test file** from `solution/test/` to `initial/test/` (identical test files in both directories)
3. Run `dart test` in the `initial/` directory to verify tests **FAIL** with clear, helpful error messages
4. Run `dart test` in the `solution/` directory to verify tests **PASS**
5. Ensure the difference between `initial/` and `solution/` clearly demonstrates the learning objective

## Summary

**Remember**: The code should be **simple and focused** on the lesson concept. The **tests should validate core functionality** without requiring code complexity. Keep starting code and solution code minimal - include all necessary code including `main()` functions, but avoid any test infrastructure or complexity added just for testing. Write **focused, minimal tests** (typically 3-7 tests) that validate the core learning objective with representative examples, not exhaustive coverage of every possible case or edge case.
