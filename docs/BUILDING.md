# Building

## Windows 11

### Requirements

The following tools are required to build this project:
- Git
- [CMake 3.15 or later](https://cmake.org/download/)
- [Visual Studio 2022 Community](https://www.visualstudio.com/downloads/)

### Build

The following instructions describe how to build this project using **CMake** and **Visual Studio**.

#### 1. Clone the repository

```
git clone https://github.com/christophemaymard/emux_gpgx.git
```

#### 2. Change directory to the repository

```
cd emux_gpgx
```

#### 3. Initialize and update submodules

```
git submodule update --init --recursive
```

#### 4. Generate the Visual Studio solution

For **Visual Studio 2022 Community**:

```
cmake -B build -G "Visual Studio 17 2022" -A x64
```

This will generate the **Visual Studio** solution in the `build/` directory of the repository.

#### 5. Build the project with the Visual Studio solution

Start **Visual Studio**, click on `Open a project or solution` and select the `EmuX_GPGX.sln` file, located in the `build/` directory of the repository.

Choose a build configuration (e.g., `Debug` or `Release`).

Right-click on the main project, `emux_cli`, and click on `Build`.
