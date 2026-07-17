# Changelog

## [1.2.0](https://github.com/fltoss/za_id_number/compare/v1.1.0...v1.2.0) (2026-07-17)


### Features

* modernize package ([19f5be5](https://github.com/fltoss/za_id_number/commit/19f5be5b4ec20f5c09979fe946d4a496d339275d))


### Bug Fixes

* correct age calculation when birthday has not yet occurred this year ([1f8928d](https://github.com/fltoss/za_id_number/commit/1f8928d78c7d03d1aefbea224d7895d46a746762))
* use File.stream!/1 for Elixir 1.15 compatibility ([9fc5167](https://github.com/fltoss/za_id_number/commit/9fc5167464101f35fe840e8f0df07495f1fbf435))

## [1.1.1] (2025-11-10)

### Bug Fixes

* remove unreachable pattern match in validator causing Dialyzer warning
* fix typo in Luhn module documentation ("algorith" -> "algorithm")

### Documentation

* update README with correct version number (1.1 instead of 1.0.0)
* add detailed South African ID number format explanation
* add real working example instead of placeholder
* document all error messages returned by validator
* add usage example with optional `today:` parameter
* improve development section with code quality commands

## [1.1.0](https://github.com/floatpays/za_id_number/compare/v1.0.0...v1.1.0) (2024-01-10)


### Features

* make validate/2 typespec more specific ([2bce1fc](https://github.com/floatpays/za_id_number/commit/2bce1fcbcce413ff6286e3d5aaeac89aa18c36a8))

## 1.0.0 (2023-07-28)


### Features

* add validate function ([b54e75a](https://github.com/floatpays/za_id_number/commit/b54e75a8f63ecd82ed37d270209a080c3ae24bea))
* generate mix project ([e99b079](https://github.com/floatpays/za_id_number/commit/e99b07977ca2fd5229fa5051b9a1b8c7868f28b9))
* update package information ([89ebb3a](https://github.com/floatpays/za_id_number/commit/89ebb3a034cb935fba328e52007583403ca3621e))


### Bug Fixes

* allow nil id_number and don't require options ([996d851](https://github.com/floatpays/za_id_number/commit/996d851f71d60cf2f94511b2dea2a5fbd08336ea))
* do not crash when value is an integer ([c6f7745](https://github.com/floatpays/za_id_number/commit/c6f77457f68262375cd6af529c9b30a96486fd06))
* fix eos issue when parsing the string ([44deba5](https://github.com/floatpays/za_id_number/commit/44deba5666c5653d285e1326b2bdd76917146d5f))

## [0.1.4] 

Add automated releases
