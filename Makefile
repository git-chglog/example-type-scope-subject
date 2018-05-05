.PHONY: dry_changelog
dry_changelog:
	@git-chglog -c .chglog/kac.yml --next-tag $(tag)
	@echo "-------------------- >8 --------------------"
	@git-chglog -c .chglog/standard.yml --next-tag $(tag)
	@echo "-------------------- >8 --------------------"
	@git-chglog -c .chglog/cool.yml --next-tag $(tag)

.PHONY: changelog
changelog:
	@git-chglog -c .chglog/kac.yml --next-tag $(tag) -o CHANGELOG.kac.md
	@git-chglog -c .chglog/standard.yml --next-tag $(tag) -o CHANGELOG.standard.md
	@git-chglog -c .chglog/cool.yml --next-tag $(tag) -o CHANGELOG.cool.md
	@git commit -am "release(*): Release $(tag)"
	@git tag $(tag)
