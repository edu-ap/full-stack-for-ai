#!/bin/bash
pandoc -s --toc --template=custom_template.tex metadata.yaml 1-unix-operating-systems.md 2-unix-file-permissions.md 3-bash-scripting.md 4-git-basics.md 5-github-cli.md 6-virtual-machines.md 7-docker-basics.md 8-cloud-fundamentals.md 9-infrastructure-as-code.md 10-networking-basics.md 11-security-basics.md 12-authentication.md 13-web-development.md 14-logging-monitoring.md 15-database-basics.md 16-ai-embeddings.md 17-user-auth-state.md 18-payment-integration.md 19-cost-optimization.md 20-full-stack-ai-app.md -o book.pdf
brave-browser book.pdf
