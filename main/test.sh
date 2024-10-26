# /bin/bash

os_version=$(grep 'VERSION=' /etc/os-release)
ruby_versions=$(rvm list strings)

echo "OS version: $os_version"
for version in $ruby_versions; do
    echo "Running with Ruby $version..."
    source /usr/local/rvm/scripts/rvm
    rvm use "$version"
    bundle install
    echo "============================="
done
