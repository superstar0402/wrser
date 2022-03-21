.PHONY: all
all: bindings mocks contracts

.PHONY: bindings
bindings:
	@make -C packages/bindings

.PHONY: mocks
mocks:
	@make -C packages/mocks

.PHONY: contracts
contracts:
	@make -C contracts

.PHONY: clean
clean:
	@make -C packages/bindings clean
	@make -C packages/mocks clean
	@make -C contracts clean

.PHONY: tutorial
tutorial:
	@make -C contracts/tutorial pre-optimize

.PHONY: optimize-tutorial
optimize-tutorial:
	@make -C contracts/tutorial optimize

.PHONY: attrs
attrs:
	@make -C contracts/attrs

.PHONY: marker
marker:
	@make -C contracts/marker

.PHONY: name
name:
	@make -C contracts/name

.PHONY: scope
scope:
	@make -C contracts/scope

.PHONY: build-release-zip
build-release-zip: tutorial
	cd ./contracts/tutorial/artifacts && \
	  zip -u provwasm_tutorial.zip provwasm_tutorial.wasm && \
	cd ../../..

.PHONY: build-release-checksum
build-release-checksum:
	cd ./contracts/tutorial/artifacts && \
	  shasum -a 256 *.zip  > sha256sum.txt && \
	cd ../../..

.PHONY: test-tutorial
test-tutorial: tutorial optimize-tutorial
	docker build -t tests . --build-arg test_script="./scripts/tutorial_test.sh" --build-arg contract_location="./contracts/tutorial/artifacts/provwasm_tutorial.wasm" --build-arg contract_destination="provwasm_tutorial.wasm"
	docker run tests "./scripts/tutorial_test.sh"

.PHONY: test-attrs
test-attrs: attrs
	docker build -t tests . --build-arg test_script="./scripts/attrs_test.sh" --build-arg contract_location="./contracts/attrs/artifacts/attrs.wasm" --build-arg contract_destination="attrs.wasm"
	docker run tests "./scripts/attrs_test.sh"

.PHONY: test-marker
test-marker: marker
	docker build -t tests . --build-arg test_script="./scripts/marker_test.sh" --build-arg contract_location="./contracts/marker/artifacts/marker.wasm" --build-arg contract_destination="marker.wasm"
	docker run tests "./scripts/marker_test.sh"

.PHONY: test-name
test-name: name
	docker build -t tests . --build-arg test_script="./scripts/name_test.sh" --build-arg contract_location="./contracts/name/artifacts/name.wasm" --build-arg contract_destination="name.wasm"
	docker run tests "./scripts/name_test.sh"

.PHONY: test-scope
test-scope: scope
	docker build -t tests . --build-arg test_script="./scripts/scope_test.sh" --build-arg contract_location="./contracts/scope/artifacts/scope.wasm" --build-arg contract_destination="scope.wasm"
	docker run tests "./scripts/scope_test.sh"