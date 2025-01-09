# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2025-01-09
### Changed
- upgrade Rake to v13 to resolve [CVE-2020-8130](https://github.com/advisories/GHSA-jppv-gw3r-w3q8)
- minimum required Ruby version to 3.1.2, dropping support for 2.x and 3.0

## [0.2.0] - 2018-07-12
### Changed
- Rescue Exceptions from the subject in the its_side_effects_are helper, so
  that it is possible to check the side effects of a method which is expected
  to raise an error

## [0.1.0] - 2018-05-02
### Added
- Add the its_side_effects_are helper, as well as its aliases it_has_side_effects
  and specify_side_effects.
