# Description

Just issue `scripts/magic.sh` command to clone, patch, build and process fat (arm64, armv7, x86_64, i386) static `libclang` library and include files. Result can be found in `libclang` directory.

# Comments

It's not perfect ...

* it builds almost everything from llvm tree
* it fails for random architecture sometimes, but everything needed for `libclang` was already compiled, not a big issue,
* etc.

... but it builds what I need now.

Feel free to fork, fix and provide pull request.