# Update the README.md version badge with the latest tag
update-badge:
	version=$$(git tag --list | tail -1); \
		sed -i '' "s/badge.version-[0-9]*\.[0-9]*-green.svg/badge\/version-$${version}-green.svg/" README.md

# Tag the repo with a new release version
# USAGE:
#   make release VERSION=8.8
release:
	git checkout -b update-version-to-$${VERSION}
	git tag $${VERSION} -m "Update version number to $${VERSION}"
	make update-badge
	git add README.md
	git commit -m "Update version badge in README.md to $${VERSION}"
	git push --follow-tags origin update-version-to-$${VERSION}
	echo "Please raise a PR from this branch"

.PHONY: release update-badge

