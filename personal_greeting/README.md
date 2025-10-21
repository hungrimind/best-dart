# Personal Greeting - String Concatenation and Interpolation

## 📚 Lesson Overview

This lesson teaches string concatenation and interpolation in Dart through a practical coding challenge. You'll learn how to combine different data types (strings and integers) into formatted strings.

## 🎯 Learning Objectives

- Understand string concatenation using the `+` operator
- Master string interpolation using `$` and `${}` syntax
- Learn when to use interpolation vs concatenation
- Practice combining multiple variables into a formatted string

## 💻 Challenge

Complete the `createGreeting` function that takes a user's `name` (String) and `visits` (int) and returns a personalized greeting string.

**Example:**
```dart
createGreeting("Alice", 10)
// Should return: "Hello Alice, this is your 10th visit!"
```

## 🚀 Getting Started

### Initial Setup (Practice)

1. Navigate to the `initial/` directory:
   ```bash
   cd personal_greeting/initial
   ```

2. Install dependencies:
   ```bash
   dart pub get
   ```

3. Run the program to see failing tests:
   ```bash
   dart run bin/personal_greeting.dart
   ```

4. Open `bin/personal_greeting.dart` and complete the `createGreeting` function

5. Run again to see your tests pass!

### Solution (Reference)

The `solution/` directory contains the complete working implementation. Use it as a reference if you get stuck.

```bash
cd personal_greeting/solution
dart pub get
dart run bin/personal_greeting.dart
```

## 🧪 Running Tests

Both directories include tests that validate the implementation:

```bash
# Run inline tests
dart run bin/personal_greeting.dart

# Run test framework
dart test
```

## 💡 Key Concepts

### String Interpolation (Recommended)
```dart
"Hello $name, this is your ${visits}th visit!"
```
- Clean and readable
- Use `$variable` for simple variables
- Use `${expression}` for expressions or when concatenating with text

### String Concatenation (Alternative)
```dart
"Hello " + name + ", this is your " + visits.toString() + "th visit!"
```
- More verbose
- Requires explicit `.toString()` for non-string types
- Can be harder to read with many variables

## ✅ Success Criteria

Your implementation should:
- Return a greeting starting with "Hello "
- Include the user's name
- Include the visit count
- End with "th visit!"
- Have proper spacing throughout

All tests should pass with ✅ PASSED markers.

## 📖 Further Learning

After completing this challenge, you'll be ready to:
- Work with more complex string formatting
- Handle user input and output
- Build interactive CLI applications
- Learn about Dart's other string methods

---

**Happy Coding! 🎉**

