# Makefile for Quint Ethereum Protocol Specifications
#
# This Makefile provides shortcuts for common Quint operations:
# - Running specifications with safety checks
# - Testing specifications
# - Verifying temporal (liveness) properties
# - Interactive exploration
#
# Usage: make [target]

# Main specification file
SPEC_FILE = main.qnt

# Safety and liveness properties to check
SAFETY_PROP = safetyOk
LIVENESS_PROP = livenessOk

# Mark all targets as phony (not representing files)
.PHONY: all test run verify verify-random repl help clean

# Default target
all: help

# Run the specification with safety invariant checks
run:
	@echo "Running specification with safety checks..."
	quint run --invariant=$(SAFETY_PROP) $(SPEC_FILE)

# Run all tests with detailed output
test:
	@echo "Running all tests..."
	quint test --verbosity 3 $(SPEC_FILE)

# Verify temporal properties (liveness checks) using bounded model checking
verify:
	@echo "Verifying liveness properties..."
	quint verify --temporal=$(LIVENESS_PROP) $(SPEC_FILE)

# Verify temporal properties using random transitions (useful for larger state spaces)
verify-random:
	@echo "Verifying liveness properties with random transitions..."
	quint verify --temporal=$(LIVENESS_PROP) --random-transitions=true $(SPEC_FILE)

# Start an interactive REPL session for exploring the specification
repl:
	@echo "Starting interactive REPL..."
	quint -r $(SPEC_FILE)::main

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	rm -rf _apalache-out

# Display help information
help:
	@echo "Available targets:"
	@echo "  make run           - Run specification with safety checks"
	@echo "  make test          - Run all tests with detailed output"
	@echo "  make verify        - Verify liveness properties"
	@echo "  make verify-random - Verify liveness with random transitions"
	@echo "  make repl          - Start interactive REPL session"
	@echo "  make clean         - Remove generated files"
	@echo "  make help          - Display this help message"
