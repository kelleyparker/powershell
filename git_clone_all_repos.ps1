$repositories = @(
    "ansible_v8",
    "blenderMakes",
    "C-",
    "CastleDemo_YT_Learn",
    "Csharp",
    "databases",
    "DIM",
    "dockerfiles",
    "kotlin",
    "landscape_automation_setup",
    "learning-terraform-3087701",
    "linuxscripts",
    "MMX2_webSite",
    "MMX_WebSite",
    "nodejs",
    "powershell",
    "Python",
    "vagrant",
    "w11Setup"
)

$githubUsername = "kelleyparker"

foreach ($repo in $repositories) {
    $url = "https://github.com/$githubUsername/$repo.git"
    git clone $url
}
