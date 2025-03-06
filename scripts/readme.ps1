$markdown = @()

$uri = 'https://blog.graa.dev'
$rssUri = ('{0}/feed.xml' -f $uri)

$rss = Invoke-RestMethod -Uri $rssUri

$markdown += "> # 👾 Hello - I'm Erik!"

$markdown += 'During the day I work as an integrator/automation enabler/technologist. ⚡'

$markdown += '## ✏️ Blog'

$markdown += ('I maintain a [blog]({0}) where I document lessons from learning about technology new to me.'-f $uri)

$markdown += '|Blog post|Category|Published'
$markdown += '| :--- | --- | --- |'

foreach ($_blog in $rss) {
    $markdown += ('|[{0}]({1})|{2}|{3}|' -f $_blog.title, $_blog.link.href, $_blog.category.term, $_blog.published.split('T')[0])
}

$markdown | Out-File -FilePath c:\temp\erikgraa\README.md -Encoding utf8