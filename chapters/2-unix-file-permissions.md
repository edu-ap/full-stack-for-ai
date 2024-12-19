\newpage
# Chapter 2: Understanding Unix File Permissions

Understanding file permissions is crucial in Unix systems, where security and multi-user capabilities are built into the core design. This chapter introduces you to the Unix permission model, its significance, and how to manage permissions effectively.

## The Unix Permission Model

Unix permissions govern how files and directories are accessed and modified. Each file or directory has three permission levels:
1. **Owner**: The user who created the file.
2. **Group**: A set of users with shared access.
3. **Others**: Everyone else on the system.

### Permission Types
Permissions are represented by a combination of characters:
- **r** (read): Allows viewing the file or listing a directory’s contents.
- **w** (write): Permits modifying the file or directory.
- **x** (execute): Enables running a file as a program or accessing a directory.

For example, a file with permissions `-rw-r--r--` means:
- The owner can read and write.
- The group can only read.
- Others can only read.

## Viewing and Modifying Permissions

### Checking Permissions
Use the `ls -l` command to view file permissions:
```bash
ls -l
```
Output example:
```bash
-rw-r--r-- 1 user group 1024 Dec 18 10:00 example.txt
```
- The first character (`-`) indicates it’s a file (a `d` would indicate a directory).
- The next nine characters represent permissions for owner, group, and others.

### Changing Permissions

#### Using `chmod`
The `chmod` command modifies file permissions. It accepts two formats:

1. **Symbolic**
- Add permissions: `chmod u+w example.txt` (adds write permission for the owner).
- Remove permissions: `chmod g-w example.txt` (removes write permission for the group).
- Set permissions: `chmod o=r example.txt` (sets others to read-only).

2. **Numeric**
Each permission has a numeric value:
- Read (`r`): 4
- Write (`w`): 2
- Execute (`x`): 1

Combine these values to set permissions:
- `chmod 644 example.txt` sets:
  - Owner: read/write (4+2=6)
  - Group: read-only (4)
  - Others: read-only (4)

### Changing Ownership
The `chown` command changes the owner and group of a file:
```bash
sudo chown new_owner:new_group example.txt
```

## Hands-On Exercises

### Exercise 1: Viewing Permissions
1. Create a file: `touch permissions_test.txt`.
2. Check its default permissions: `ls -l permissions_test.txt`.

### Exercise 2: Modifying Permissions
1. Make the file executable: `chmod +x permissions_test.txt`.
2. Restrict access to the owner: `chmod 700 permissions_test.txt`.

### Exercise 3: Changing Ownership
1. Create a new user: `sudo adduser test_user`.
2. Change the file owner to the new user: `sudo chown test_user permissions_test.txt`.

## Advanced Topics

### Default Permissions: `umask`
The `umask` value determines default permissions for newly created files and directories. View your current `umask` with:
```bash
umask
```
- Subtract the `umask` value from the full permissions (777 for directories, 666 for files) to calculate defaults.
- Change the `umask` value in your shell configuration file (e.g., `.bashrc`):
```bash
umask 022
```

### Special Permissions
1. **Setuid**: Allows a program to run with the permissions of its owner.
2. **Setgid**: Allows files in a directory to inherit the group of the directory.
3. **Sticky Bit**: Prevents users from deleting files they don’t own in a shared directory.

Set these with `chmod`:
- Setuid: `chmod u+s file`
- Setgid: `chmod g+s directory`
- Sticky Bit: `chmod +t directory`

## Best Practices
1. **Principle of Least Privilege**: Grant only the permissions necessary for tasks.
2. **Audit Regularly**: Periodically check and update permissions.
3. **Avoid `777`**: Never set full permissions (`rwxrwxrwx`) on files or directories.

## Summary

In this chapter, you learned:
- The Unix permission model and its components.
- How to view, modify, and manage file permissions.
- Advanced topics like `umask` and special permissions.

Mastering file permissions is essential for maintaining a secure and efficient Unix environment. In the next chapter, you’ll explore BASH scripting fundamentals to automate tasks and enhance productivity.

