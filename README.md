# CMake Example: Testing C with Unity + CMock

Personally, I don't like the structure of this project but it's simple enough to understand it easily.

## Setup

```bash
git submodule update --init
mkdir build && cd build
cmake ..
cmake --build .
ctest
```

## CMake Formatting

`cmake-format` is abandoned.
Some comments suggests that [gersemi](https://github.com/BlankSpruce/gersemi) might be a good alternative

For python packages, I suggest using [uv](https://docs.astral.sh/uv/) to manage python envs and packages.

```bash
uv tool install gersemi
gersemi -i <CMakeLists or directories>
```
