# Copyright 2024 The Google raft-rs authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/usr/bin/env bash

# Exit when any command fails
#set -e

printf "\n// cargo fmt --all -- --check\n\n"
env cargo fmt --all -- --check

printf "\n// cargo clippy --all --all-targets -- -D clippy::all && cargo clippy --no-default-features --features prost-codec --features std -- -D clippy::all\n\n"
env cargo clippy --all --all-targets -- -D clippy::all && cargo clippy --no-default-features --features prost-codec --features std -- -D clippy::all

printf "\n// cargo build --no-default-features --features prost-codec --target x86_64-unknown-none\n\n"
env cargo build --no-default-features --features prost-codec --target x86_64-unknown-none

printf "\n// cargo test --all --no-default-features --features=prost-codec --features=default-logger --no-fail-fast -- --nocapture\n\n"
env cargo test --all --no-default-features --features=prost-codec --features=default-logger --no-fail-fast -- --nocapture

printf "\n// cargo test --all  --no-fail-fast -- --nocapture\n\n"
env cargo test --all  --no-fail-fast -- --nocapture

printf "\n// cargo bench --all -- --test\n\n"
env cargo bench --all -- --test

printf "\n// cargo test --tests --features failpoints --package harness -- --nocapture\n\n"
env cargo test --tests --features failpoints --package harness -- --nocapture

printf "\n// cargo test --no-default-features --features prost-codec --features std -- --nocapture\n\n"
env cargo test --no-default-features --features prost-codec --features std -- --nocapture
