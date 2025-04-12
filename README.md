# quint-eth-template
A template repository for writing formal specifications of smart contract protocols using [Quint](https://quint-lang.org/).

## Overview
This repository provides a structured foundation for creating precise, executable specifications of Ethereum-based decentralized applications. By using formal specification with [Quint](https://quint-lang.org/), developers can rigorously verify protocol behavior before implementation, catching edge cases and vulnerabilities early in the development process.

## Features
- Ready-to-use Quint templates for common Ethereum protocol components
- Modular architecture to build complex protocol specifications from simpler parts

## How to Use
This repository includes a `Makefile` with helpful commands for working with your specifications:

```sh
make run      # Run the specification with safety invariant checks
make test     # Run all tests with detailed output
make verify   # Verify temporal properties (liveness checks)
make rnd      # Verify temporal properties using random transitions
make repl     # Start an interactive REPL session
```

## Why Formal Specification?
Ethereum smart contracts are immutable once deployed and often handle significant value. Formal specification with Quint allows you to:

- Precisely define protocol behaviors and state transitions
- Mathematically verify critical safety and liveness properties
- Detect potential vulnerabilities before implementation
- Create a clear reference for smart contract developers
- Document protocol behavior in an unambiguous, executable format

