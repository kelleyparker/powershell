# Define your GitHub username
$githubUsername = "kelleyparker"

# Create the URL to fetch repositories using GitHub API
$reposUrl = "https://api.github.com/users/$githubUsername/repos"

# Fetch repositories using Invoke-RestMethod
$repos = Invoke-RestMethod -Uri $reposUrl

# Iterate through the repositories and clone them
foreach ($repo in $repos) {
    $repoName = $repo.name
    $cloneUrl = $repo.clone_url
    Write-Host "Cloning $repoName..."
    git clone $cloneUrl
}

Write-Host "All repositories cloned successfully."
