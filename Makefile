GO			:= GOBIN=$(CURDIR)/bin go
SWAGGER		:= bin/swagger
GOMODDEPS 	:= go.mod go.sum

go-list-pkg-sources = $(GO) list -f '{{ range $$index, $$filename := .GoFiles }}{{ $$.Dir }}/{{ $$filename }} {{end}}' $(1)
go-pkg-sourcefiles = $(shell $(call go-list-pkg-sources,$(strip $1)))

.PHONY: all swagger
all: swagger

swagger: $(SWAGGER)
	@$(SWAGGER) generate spec --scan-models -o=./swagger.yml

$(SWAGGER): $(GOMODDEPS) $(call go-pkg-sourcefiles, github.com/go-swagger/go-swagger/cmd/swagger)
	@$(GO) install github.com/go-swagger/go-swagger/cmd/swagger
