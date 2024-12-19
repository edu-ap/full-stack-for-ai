\newpage
# Chapter 4: Version Control with Git

Version control is an essential tool for developers, enabling collaboration, tracking changes, and maintaining project history. Git, a distributed version control system, is the industry standard for managing code repositories efficiently and reliably.

## What is Git?

Git is a version control system that allows developers to:
1. Track changes to files over time.
2. Collaborate with others without overwriting each other’s work.
3. Revert to previous versions when necessary.
4. Branch and experiment with features without affecting the main codebase.

### Why Use Git?
1. **Collaboration**: Work seamlessly with teams.
2. **History**: Maintain a detailed log of changes.
3. **Backup**: Protect code from accidental loss.
4. **Branching**: Experiment with new features without disrupting the main project.

## Installing Git

### On Linux
```bash
sudo apt update
sudo apt install git
```

### On macOS
Install Git using Homebrew:
```bash
brew install git
```

### On Windows
Download the installer from [git-scm.com](https://git-scm.com/) and follow the setup instructions.

### Verify Installation
Run the following command to verify Git is installed:
```bash
git --version
```

## Basic Git Workflow

1. **Initialize a Repository**
   Create a new repository to track changes:
   ```bash
   git init
   ```

2. **Add Files**
   Stage files for tracking:
   ```bash
   git add filename
   ```
   Add all files:
   ```bash
   git add .
   ```

3. **Commit Changes**
   Save a snapshot of the staged changes:
   ```bash
   git commit -m "Initial commit"
   ```

4. **Check Status**
   View the current state of the repository:
   ```bash
   git status
   ```

5. **View History**
   Review commit history:
   ```bash
   git log
   ```

## Working with Remote Repositories

### Cloning a Repository
Copy an existing repository to your local machine:
```bash
git clone https://github.com/username/repo.git
```

### Linking a Remote Repository
Add a remote to your local repository:
```bash
git remote add origin https://github.com/username/repo.git
```

### Pushing Changes
Upload your commits to the remote repository:
```bash
git push origin main
```

### Pulling Changes
Fetch and merge changes from the remote repository:
```bash
git pull origin main
```

## Branching and Merging

### Creating a Branch
Branching allows you to work on a feature without affecting the main codebase:
```bash
git branch feature-branch
```
Switch to the new branch:
```bash
git checkout feature-branch
```

### Merging a Branch
Combine changes from a branch into the main codebase:
1. Switch to the main branch:
   ```bash
   git checkout main
   ```
2. Merge the feature branch:
   ```bash
   git merge feature-branch
   ```

### Deleting a Branch
Clean up branches after merging:
```bash
git branch -d feature-branch
```

## Resolving Merge Conflicts
Merge conflicts occur when changes from different branches overlap. Git highlights the conflict in the affected files. Resolve conflicts by:
1. Editing the file to retain desired changes.
2. Staging the resolved file:
   ```bash
   git add filename
   ```
3. Committing the resolution:
   ```bash
   git commit
   ```

## Hands-On Exercises

### Exercise 1: Initialize a Repository
1. Create a directory:
   ```bash
   mkdir my_project && cd my_project
   ```
2. Initialize Git:
   ```bash
   git init
   ```
3. Create a file and track it:
   ```bash
   echo "Hello Git" > readme.md
   git add readme.md
   git commit -m "Add readme"
   ```

### Exercise 2: Create and Merge Branches
1. Create a branch:
   ```bash
   git branch new-feature
   ```
2. Switch to the branch and make changes:
   ```bash
   git checkout new-feature
   echo "Feature work" >> feature.txt
   git add feature.txt
   git commit -m "Add feature work"
   ```
3. Merge into the main branch:
   ```bash
   git checkout main
   git merge new-feature
   ```

## Best Practices
1. **Commit Often**: Make small, frequent commits with meaningful messages.
2. **Pull Before Push**: Sync with the remote repository before pushing changes.
3. **Use Branches**: Keep the main branch clean and stable.
4. **Review Changes**: Use `git diff` to review modifications before committing.

## Summary

In this chapter, you learned:
- The basics of Git and its installation.
- Core Git commands for version control.
- How to work with branches and resolve merge conflicts.

Git is an indispensable tool for modern software development, ensuring collaboration and code integrity. In the next chapter, we’ll explore GitHub CLI and collaboration techniques to enhance your workflow.

