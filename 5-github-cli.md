\newpage
# Chapter 5: GitHub CLI and Collaboration

GitHub is the most popular platform for hosting and collaborating on Git repositories. While the GitHub web interface is powerful, the GitHub Command Line Interface (CLI) enhances productivity by allowing you to manage repositories, issues, and pull requests directly from your terminal. This chapter focuses on using the GitHub CLI and best practices for team collaboration.

## What is GitHub CLI?

GitHub CLI is a command-line tool that integrates GitHub workflows into your terminal. With GitHub CLI, you can:
1. Clone repositories.
2. Create and merge pull requests.
3. Manage issues and discussions.
4. Perform actions on repositories without switching to the web interface.

### Installing GitHub CLI

#### On Linux
```bash
sudo apt update
sudo apt install gh
```

#### On macOS
Install using Homebrew:
```bash
brew install gh
```

#### On Windows
Download the installer from [cli.github.com](https://cli.github.com/).

### Authentication
Authenticate with your GitHub account:
```bash
gh auth login
```
Follow the interactive prompts to log in via the web or SSH.

## Essential GitHub CLI Commands

### Repository Management

1. **Cloning a Repository**
   ```bash
   gh repo clone username/repository-name
   ```

2. **Creating a New Repository**
   ```bash
   gh repo create repository-name
   ```
   - Use `--public` or `--private` to set visibility.

3. **Viewing Repository Details**
   ```bash
   gh repo view
   ```

### Pull Requests

1. **Creating a Pull Request**
   ```bash
   gh pr create --title "Add feature X" --body "Description of the feature."
   ```

2. **Viewing Pull Requests**
   ```bash
   gh pr list
   ```

3. **Checking Out a Pull Request**
   ```bash
   gh pr checkout pull-request-number
   ```

4. **Merging a Pull Request**
   ```bash
   gh pr merge pull-request-number
   ```

### Issues

1. **Creating an Issue**
   ```bash
   gh issue create --title "Bug in feature Y" --body "Steps to reproduce the issue."
   ```

2. **Viewing Issues**
   ```bash
   gh issue list
   ```

3. **Closing an Issue**
   ```bash
   gh issue close issue-number
   ```

### Discussions
Engage with the community via GitHub Discussions:
```bash
gh discussion list
```

### Notifications
Manage notifications directly from the CLI:
```bash
gh notification list
```

## Collaboration Best Practices

### Branch Naming Conventions
Use descriptive and consistent names for branches, such as:
- `feature/add-login`
- `bugfix/fix-crash`
- `hotfix/update-logo`

### Commit Messages
Write meaningful commit messages:
1. **Start with a verb**: e.g., "Add," "Fix," "Update."
2. **Describe the change**: e.g., "Fix crash on login screen."

### Code Reviews
- Review pull requests thoroughly.
- Use comments to suggest improvements.
- Approve or request changes as needed.

### Managing Issues
- Assign issues to team members.
- Use labels (e.g., `bug`, `enhancement`) for better tracking.
- Close issues automatically with commit messages:
  ```
  Fixes #123
  ```

### Use Project Boards
Organize tasks using GitHub Project Boards:
1. Create columns for stages (e.g., To Do, In Progress, Done).
2. Move cards as tasks progress.

## Hands-On Exercises

### Exercise 1: Create a Repository
1. Create a new repository using the CLI:
   ```bash
   gh repo create my-project --public
   ```
2. Clone the repository:
   ```bash
   gh repo clone username/my-project
   ```

### Exercise 2: Manage Pull Requests
1. Create a branch:
   ```bash
   git checkout -b add-readme
   ```
2. Add and commit a README file:
   ```bash
   echo "# My Project" > README.md
   git add README.md
   git commit -m "Add README"
   ```
3. Push the branch and create a pull request:
   ```bash
   git push origin add-readme
   gh pr create --title "Add README" --body "Initial README file."
   ```
4. Merge the pull request:
   ```bash
   gh pr merge
   ```

## Summary

In this chapter, you learned:
- How to use GitHub CLI for repository management, pull requests, and issues.
- Best practices for collaboration on GitHub.

GitHub CLI enhances productivity by streamlining GitHub workflows. In the next chapter, we’ll explore virtualization and containerization with tools like Docker.

