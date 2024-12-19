\newpage
# Chapter 3: BASH Scripting Fundamentals

BASH (Bourne Again SHell) scripting is a powerful tool in Unix-based systems that allows users to automate repetitive tasks, streamline workflows, and manage system processes efficiently. This chapter introduces you to the fundamentals of BASH scripting, including syntax, common constructs, and practical examples.

## What is a BASH Script?

A BASH script is a text file containing a series of commands that the BASH shell executes sequentially. Scripts are used for automation, system management, and even building simple applications.

### Why Learn BASH Scripting?
1. **Automation**: Eliminate repetitive manual tasks.
2. **Efficiency**: Simplify complex command sequences.
3. **Portability**: Write scripts that run on any Unix-based system.
4. **Customization**: Tailor scripts to specific needs.

## Writing Your First Script

### Creating the Script File
1. Open a terminal and create a new file:
   ```bash
   touch first_script.sh
   ```
2. Open the file in a text editor (e.g., nano, vim, or VS Code).
   ```bash
   nano first_script.sh
   ```
3. Add the following content:
   ```bash
   #!/bin/bash
   echo "Hello, World!"
   ```
   - `#!/bin/bash` specifies the interpreter for the script.
   - `echo` outputs text to the terminal.

### Making the Script Executable
1. Change the file permissions:
   ```bash
   chmod +x first_script.sh
   ```
2. Run the script:
   ```bash
   ./first_script.sh
   ```

### Output
You should see:
```
Hello, World!
```

## Variables and Input

### Defining Variables
Variables store data for use within a script.
```bash
name="John"
echo "Hello, $name!"
```
Output:
```
Hello, John!
```

### User Input
Use the `read` command to accept input:
```bash
#!/bin/bash
read -p "Enter your name: " user_name
echo "Welcome, $user_name!"
```

### Hands-On Exercise
- Write a script that asks for a user’s favorite programming language and displays a personalized message.

## Control Structures

### Conditional Statements
Perform actions based on conditions.
```bash
#!/bin/bash
if [ "$1" == "hello" ]; then
  echo "Hi there!"
else
  echo "Try saying 'hello'!"
fi
```
- `$1` represents the first argument passed to the script.

### Loops
Automate repetitive tasks using loops.

#### `for` Loop
```bash
for i in {1..5}; do
  echo "Iteration $i"
done
```

#### `while` Loop
```bash
count=1
while [ $count -le 5 ]; do
  echo "Count: $count"
  ((count++))
done
```

## Functions

Define reusable blocks of code within a script:
```bash
#!/bin/bash
greet() {
  echo "Hello, $1!"
}
greet "John"
```
Output:
```
Hello, John!
```

## Debugging Scripts

### Enabling Debug Mode
Run a script with `bash -x` to see each command as it executes:
```bash
bash -x script.sh
```

### Adding Debug Statements
Use `set` to enable debugging within a script:
```bash
set -x
# commands
set +x
```

## Best Practices

1. **Use Comments**: Document your scripts for clarity.
   ```bash
   # This script greets the user
   ```
2. **Error Handling**: Check for errors using `if` statements and exit codes.
3. **Modularize**: Break large scripts into functions.
4. **Test Iteratively**: Test small sections of your script to identify issues early.

## Hands-On Project
Create a script that:
1. Accepts a directory path from the user.
2. Checks if the directory exists.
3. Lists the contents if it exists or displays an error if it doesn’t.

### Example Solution
```bash
#!/bin/bash
read -p "Enter directory path: " dir
if [ -d "$dir" ]; then
  echo "Contents of $dir:"
  ls "$dir"
else
  echo "Directory not found."
fi
```

## Summary

In this chapter, you learned:
- How to write and execute BASH scripts.
- Using variables, user input, and control structures.
- Defining and using functions.
- Debugging and best practices.

With BASH scripting, you can automate tasks and build a strong foundation for more complex system management. In the next chapter, we’ll explore version control with Git, an essential tool for collaborative development.

