$name = (Get-Content ./build/info.json | jq -r '.name')
$version = (Get-Content ./build/info.json | jq -r '.version')
$out_name = "${name}_${version}"

npx tstl

Remove-Item -Recurse -Force "../$out_name" -ErrorAction SilentlyContinue
Copy-Item -Recurse -Force "./build/" "../$out_name/"
