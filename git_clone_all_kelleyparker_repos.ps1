# Define your GitHub username
$githubUsername = "kelleyparker"

# Create the URL to fetch repositories using GitHub API
$reposUrl = "https://api.github.com/users/$githubUsername/repos"

# Fetch repositories using Invoke-RestMethod
$repos = Invoke-RestMethod -Uri $reposUrl

# Iterate through the repositories and ask for confirmation before cloning
foreach ($repo in $repos) {
    $repoName = $repo.name
    $cloneUrl = $repo.clone_url

    $response = Read-Host "Do you want to clone repository '$repoName'? (y/n)"
    if ($response -eq 'y' -or $response -eq 'Y') {
        Write-Host "Cloning $repoName..."
        git clone $cloneUrl
    }
    else {
        Write-Host "Skipped cloning $repoName."
    }
}

Write-Host "All repositories cloned successfully."
