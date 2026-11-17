# avo_main

Base addon of the mod. It has no code, only what every other addon includes.

- `script_mod.hpp`: prefix (`avo`), mod name, author, `REQUIRED_VERSION` and the version macros. The version comes from `script_version.hpp`, which the `pre_build/set_version.rhai` hook keeps in sync with the release.
- `script_macros.hpp`: pulls in the CBA and ACE macros, and adds `ACEGVAR`/`ACEFUNC`/`ACEPATHTOF`, `ACREGVAR`/`ACREFUNC`/`ACREPATHTOF` and `TFARFUNC`. CBA's `EGVAR`/`EFUNC` always use this mod's prefix, so references to other mods need their own macros.
- `config.cpp`: requires nothing. CBA and ACE are required by `avo_common`, so this addon always loads and only the feature addons are skipped when they are missing.
