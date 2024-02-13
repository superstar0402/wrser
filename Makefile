.PHONY: all
all: provwasm-std contracts

.PHONY: provwasm-std
provwasm-std:
	@make -C packages/provwasm-std

.PHONY: contracts
contracts:
	@make -C contracts

.PHONY: clean
clean:
	@make -C packages/provwasm-std clean
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

.PHONY: ibc
attrs:
	@make -C contracts/ibc

.PHONY: marker
marker:
	@make -C contracts/marker

.PHONY: msgfees
msgfees:
	@make -C contracts/msgfees

.PHONY: name
name:
	@make -C contracts/name

.PHONY: nft
name:
	@make -C contracts/nft

.PHONY: scope
scope:
	@make -C contracts/scope

.PHONY: template
scope:
	@make -C contracts/template

.PHONY: trigger
scope:
	@make -C contracts/trigger
