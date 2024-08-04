


# List and uninstall all globally installed npm packages
npm list -g --depth=0 | ForEach-Object {
    if ($_ -match '^.+? +?([^\s]+)@') {
        $packageName = $matches[1]
        npm uninstall -g $packageName
    }
}

# Clear npm cache
npm cache clean --force
