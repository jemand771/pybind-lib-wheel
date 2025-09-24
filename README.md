# pybind-lib-wheel

My pybind build system playground.

## Why

I want to (re)build a project that uses the following tech stack / tools:

* Python module written in C++ using [pybind11](https://github.com/pybind/pybind11)
  * most notably, a module that links against shared libraries from the same project
* CMake-based build system
* wheel config defined in pyproject.toml
* [scikit-build-core](https://github.com/scikit-build/scikit-build-core) backend
* portable wheels using [auditwheel](http://github.com/pypa/auditwheel)/[delvewheel](https://github.com/adang1345/delvewheel)
* Supported platforms: linux x86_64, linux aarch64, windows x86_64 (amd64)
  * doesn't need to cross-compile, emulation / native agents are fine

While all of the projects mentioned above provide _some_ sort of getting started guide, I've never gotten it all to work together.
Instead of tinkering inside the project I _actually_ want to use this in (and wait 5 minutes for it to rebuild for each attempt), I'll replicate the core cmake skeleton here and enjoy a slightly less painful DX.

## Contributing

If you're seeing this and think you can help, feel free to create a PR.
