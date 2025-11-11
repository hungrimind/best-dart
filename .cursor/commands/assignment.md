--- Cursor Command: assignment.md ---

Generate an assignment description by comparing the `initial/bin/` and `solution/bin/` Dart files in a lesson directory.

## Process

1. **Check for initial prompt in chat history**:
   - Look for a user message at the beginning of the conversation that contains "### Idea and Learning Objective" or "### Assignment:" or similar lesson description
   - Extract story elements, context, and narrative details from this prompt
   - Use these story elements to make the assignment more engaging and contextual

2. **Identify the lesson directory**:
   - If a lesson folder name is provided, use that (e.g., `nightclub_bouncer`, `hello`, `silent_treatment`)
   - If run from within a lesson folder, detect the current directory name
   - If neither, list available lesson folders and ask the user to specify

3. **Read the code files**:
   - Find the main Dart file in `{lesson_dir}/initial/bin/` (usually `{lesson_name}.dart` or `main.dart`)
   - Read `{lesson_dir}/initial/bin/{main_file}.dart`
   - Read `{lesson_dir}/solution/bin/{main_file}.dart`
   - Both files should exist and be readable

4. **Analyze the differences**:
   - Compare the initial code and solution code line by line
   - Identify the key differences:
     - **Missing code blocks**: Incomplete if-else statements, missing else clauses, incomplete loops
     - **Incorrect values**: Typos in strings, wrong variable names, incorrect numbers
     - **Missing code**: Missing variable declarations, missing assignments, missing function calls
     - **Commented code**: Lines that need to be commented or uncommented
     - **Missing imports**: Required imports that are missing
     - **Empty implementations**: TODO comments or empty function bodies that need completion
     - **Logic errors**: Wrong operators, incorrect conditions, wrong order of operations

5. **Determine the learning objective**:
   - What concept is being taught? (if-else, string interpolation, escape characters, comments, etc.)
   - What is the primary change needed to transform initial → solution?
   - Focus on the MAIN learning objective, not every minor difference

6. **Generate the assignment**:
   - Write a clear, concise assignment description
   - **Start with "## Assignment"**
   - **Keep it SHORT**: Aim for 2-4 sentences maximum. Do NOT include "Provided Context" sections or lengthy explanations
   - **Incorporate story elements briefly**: If an initial prompt was found, use 1 sentence to set the scene (e.g., "You are managing a sports team's roster. A new player named 'David' has just joined the team.")
   - **Focus on tasks only**: List the specific actions the learner needs to take
   - Use imperative language: "Add", "Complete", "Fix", "Change", "Write", etc.
   - Be specific about what needs to be done
   - Reference specific code elements when helpful (function names, variable names, exact strings)
   - If multiple steps, use a numbered list (1., 2., 3.)
   - Keep it focused on the learning objective
   - **Do NOT repeat information already visible in the code** (e.g., don't list variable names or values that are already in the starter code)

7. **Output format**:
   - Wrap the entire assignment in a markdown code block (triple backticks)
   - The assignment should be ready to copy-paste
   - Format it as clean markdown that will render nicely

## Assignment Writing Guidelines

- **Be concise**: Keep assignments short (2-4 sentences). Avoid lengthy explanations or "Provided Context" sections
- **Be specific**: Reference exact strings, variable names, or code elements when it helps clarity
- **Be actionable**: Focus on what the learner should DO, not what's wrong
- **Focus on tasks**: List the specific actions needed, not background information
- **Use story elements sparingly**: One sentence to set context is enough. Don't over-explain the scenario
- **Focus on the concept**: The assignment should guide toward understanding the core lesson concept
- **Avoid spoilers**: Don't give away the exact solution, but provide enough guidance
- **Don't repeat code**: Don't list variable names, values, or code structure that's already visible in the starter code

## Common Patterns

### Pattern 1: Commenting code

- Look for: A print statement in initial that's commented in solution
- Assignment: "In the `main` function, find the line that prints `[exact string]` and add a single-line comment at the beginning of it."

### Pattern 2: Fixing typos

- Look for: String differences (typos)
- Assignment: "In the `main` function, find and fix the typo in the print statement. [Hint about what's wrong]"

### Pattern 3: Completing conditional statements

- Look for: Incomplete if statements missing else clauses
- Assignment: "Complete the if-else statement in the `main` function. Add an `else` clause that [describes what it should do]."

### Pattern 4: Adding escape characters

- Look for: Empty strings or incomplete strings that need escaping
- Assignment: "In the `main` function, complete the print statement to display: `[target output]`. You'll need to escape [which characters]."

### Pattern 5: Adding missing code

- Look for: TODO comments or empty implementations
- Assignment: "Complete the [function/block] by [specific action]. [Additional guidance if needed]."

### Pattern 6: Variable operations

- Look for: Missing variable declarations, assignments, or operations
- Assignment: "Add code to [declare/assign/calculate] [variable name] by [specific operation]."

## Example Outputs

### Example 1: Silent Treatment

```
## Assignment 

In the `main` function, find the line that prints `"This line should not be printed."` and add a single-line comment at the beginning of it so that it is ignored by the compiler.
```

### Example 2: Hello (typo fix)

```
## Assignment

In the `main` function, find the typo in the print statement. The word "Hlelo" should be corrected to "Hello".
```

### Example 3: Nightclub Bouncer (if-else)

```
## Assignment

Complete the if-else statement in the `main` function. Add an `else` clause that prints `"Sorry, you are not old enough to enter."` when the age is less than 18.
```

### Example 4: Escape Characters

```
## Assignment

In the `main` function, complete the print statement to display: `She said: "That's a backslash: \"`. You'll need to escape the single quote, double quotes, and backslash characters.
```

### Example 5: Team Roster (with story elements)

```
## Assignment

You are managing a sports team's roster. A new player named "David" has just joined the team, and you need to update the official roster.

1. Add "David" to the end of the `teamRoster` list.
2. However, Bob doesn't like David, so he leaves. Remove 'Bob' from the list.
```

## Execution

When this command is run:

1. Read both initial and solution Dart files
2. Analyze the differences
3. Generate the assignment description
4. Output it wrapped in a markdown code block (triple backticks)
5. The output should be ready to copy-paste directly

--- End Command ---
