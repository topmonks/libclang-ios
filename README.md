Lot of questions how to build `libclang` for iOS and very few, not complete, answers.
Here it is - kind of R&D project for `libclang` testing on iOS devices.

## Structure

* `llvm-ios` - patches and scripts to build `libclang` from the source code
* `lib` - ready to go binaries with header files

## Ready to go binaries

I had to split `libclang.a` library to several pieces (per architecture), because
of GitHub limitations (file size). Just issue `fat-lib.sh` to create fat `libclang.a`,
which does support all architectures (armv7, arm64, i386 and x86_64).

## Contact

Follow TopMonks on Twitter ([@topmonks](https://twitter.com/topmonks))

### Creator

- [Robert Vojta](http://github.com/robertvojta) ([@robertvojta](https://twitter.com/robertvojta))

## License

libclang-ios is released under the MIT license. See LICENSE for details.
