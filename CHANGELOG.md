# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](Https://conventionalcommits.org) for commit guidelines.

<!-- changelog -->

## [v1.0.0-rc.0](https://github.com/ash-project/ash_json_api/compare/v0.34.2...v1.0.0-rc.0) (2024-03-29)
### Breaking Changes:

* rewrite relationship route handling

* upgrade error patterns to be similar to AshGraphql



### Bug Fixes:

* fix nested includes wrapping :hammer: (#114)

* always use current URL as pagination base

* use related resource for introspection on related routes

* allow any path params

### Improvements:

* upgrade ash 3.0

* better error on non existent action

## [v0.34.2](https://github.com/ash-project/ash_json_api/compare/v0.34.1...v0.34.2) (2024-01-09)




### Bug Fixes:

* set filter schema as string or object

* ensure a type is always determined for aggregate fields

### Improvements:

* add `AshJsonApiError.ToAshError`

* properly represent fields in response

## [v0.34.1](https://github.com/ash-project/ash_json_api/compare/v0.34.0...v0.34.1) (2023-12-13)




### Bug Fixes:

* properly generate relationships in json schema

* don't double add a prefix to the router

* 400 error on invalid includes instead of 500

## [v0.34.0](https://github.com/ash-project/ash_json_api/compare/v0.33.1...v0.34.0) (2023-11-13)




### Features:

* open_api options in Api (#104)

### Bug Fixes:

* accept any in filter schema issue #101 (#102)

* remove `AshJsonApi.Application` (#99)

### Improvements:

* Allow to include/exclude null values from the JSON output (#100)

## [v0.33.1](https://github.com/ash-project/ash_json_api/compare/v0.33.0...v0.33.1) (2023-09-26)




### Bug Fixes:

* various fixes for calculation handling

### Improvements:

* use phoenix endpoint if available (#95)

* Add calculated fields to OpenAPI, JSON schema (#90)

## [v0.33.0](https://github.com/ash-project/ash_json_api/compare/v0.32.1...v0.33.0) (2023-07-31)
### Breaking Changes:

* properly set 200 status on updates



## [v0.32.1](https://github.com/ash-project/ash_json_api/compare/v0.32.0...v0.32.1) (2023-07-17)




### Bug Fixes:

* relationship is an atom not a struct when fetching related

## [v0.32.0](https://github.com/ash-project/ash_json_api/compare/v0.31.3...v0.32.0) (2023-06-09)




### Features:

* add attribute description to schema (#84)

### Bug Fixes:

* don't use unnecessary `Info.action/3`

* Remove id from resource attributes (#80)

### Improvements:

* always load in query/changeset

* Add config to allow all media type params (#83)

* Filter for resources that have a json_api type defined (#79)

## [v0.31.3](https://github.com/ash-project/ash_json_api/compare/v0.31.2...v0.31.3) (2023-05-04)




### Bug Fixes:

* OpenApi: Don't cause a compilation failure when open_api_spex is not present. (#78)

* parse filter as input

* Prepend slashes to relative paths (#77)

* Match shape for definitions and schemas when generating a json schema (#75)

* only include other AshJsonApi resources

* only include other AshJsonApi relationships in schema

* properly pass `modify` option to open api plug

* use `String.to_atom/1`

* sort/pagination schema improvements

* don't pass type through to `Info.action/3`

* properly extract attribute types in json schema

* support aggregate types in serializer

* properly fetch related field for aggregate type checking

* support complex route parameters in json schema

### Improvements:

* thread context from `PlugHelpers.get_context` through to `Query` and `Changeset` (#71)

* added route default_fields with test (#76)

* update option name for pass through

* support `__using__` block for router

* Record self linking improvements (#70)

* add `read_action` to `patch` and `delete`

## [v0.31.2](https://github.com/ash-project/ash_json_api/compare/v0.31.1...v0.31.2) (2023-04-27)




### Bug Fixes:

* parse filter as input

* Prepend slashes to relative paths (#77)

* Match shape for definitions and schemas when generating a json schema (#75)

* only include other AshJsonApi resources

* only include other AshJsonApi relationships in schema

* properly pass `modify` option to open api plug

* use `String.to_atom/1`

* sort/pagination schema improvements

* don't pass type through to `Info.action/3`

* properly extract attribute types in json schema

* support aggregate types in serializer

* properly fetch related field for aggregate type checking

* support complex route parameters in json schema

### Improvements:

* thread context from `PlugHelpers.get_context` through to `Query` and `Changeset` (#71)

* added route default_fields with test (#76)

* update option name for pass through

* support `__using__` block for router

* Record self linking improvements (#70)

* add `read_action` to `patch` and `delete`

## [v0.31.1](https://github.com/ash-project/ash_json_api/compare/v0.31.0...v0.31.1) (2023-01-18)




### Improvements:

* update ash and use new docs patterns

## [v0.31.0](https://github.com/ash-project/ash_json_api/compare/v0.30.1...v0.31.0) (2022-12-29)
### Breaking Changes:

* Status should be a string from json:api documentation (#67)



### Features:

* Ash.PlugHelpers: Support standard actor/tenant configuration. (#58)

### Bug Fixes:

* properly send 415/406 errors

### Improvements:

* Serve schema with json content-type (#65)

* update ash

* use new docs

## [v0.30.1](https://github.com/ash-project/ash_json_api/compare/v0.30.0-rc.4...v0.30.1) (2022-10-25)




### Bug Fixes:

* handle newer version of ash w/ `Unknown` error changes

* delete status-code response (#57)

* proper action when deleting

### Improvements:

* update to ash 2.0

* support upsert? and upsert_identity? on post

## [v0.30.0-rc.4](https://github.com/ash-project/ash_json_api/compare/v0.30.0-rc.3...v0.30.0-rc.4) (2022-09-28)




### Bug Fixes:

* handle generated `nil` filters better

### Improvements:

* update to latest ash

## [v0.30.0-rc.3](https://github.com/ash-project/ash_json_api/compare/v0.30.0-rc.2...v0.30.0-rc.3) (2022-09-21)




### Improvements:

* update to latest ash

## [v0.30.0-rc.2](https://github.com/ash-project/ash_json_api/compare/v0.30.0-rc.1...v0.30.0-rc.2) (2022-09-15)




### Improvements:

* support latest ash

## [v0.30.0-rc.1](https://github.com/ash-project/ash_json_api/compare/v0.30.0-rc.0...v0.30.0-rc.1) (2022-08-31)




### Improvements:

* align better with `.Info` pattern

## [v0.29.1](https://github.com/ash-project/ash_json_api/compare/v0.29.0...v0.29.1) (2022-08-10)




### Bug Fixes:

* check for arguments before attributes

* handle empty path when showing schema errors

* use string argument names for required arguments

### Improvements:

* update to latest ash

## [v0.29.0](https://github.com/ash-project/ash_json_api/compare/v0.28.7...v0.29.0) (2022-04-06)




### Features:

* force minor version bump

## [v0.28.7](https://github.com/ash-project/ash_json_api/compare/v0.28.6...v0.28.7) (2022-04-06)




### Improvements:

* rework router to be an explicit module w/ registry dependency

* fully deprecate resources, try to fix compile time issues

## [v0.28.6](https://github.com/ash-project/ash_json_api/compare/v0.28.5...v0.28.6) (2022-02-03)




### Bug Fixes:

* only link the proper related records

* put action_type in auto_set_fields where it belongs

* routes -> route

* use action_type to link related routes

* set action_type on relationship routes

## [v0.28.5](https://github.com/ash-project/ash_json_api/compare/v0.28.4...v0.28.5) (2021-12-05)




### Bug Fixes:

* use `public_` everywhere

* allow including non-attributes

## [v0.28.4](https://github.com/ash-project/ash_json_api/compare/v0.28.3...v0.28.4) (2021-06-25)




### Bug Fixes:

* handle integer and boolean types right (#53)

## [v0.28.3](https://github.com/ash-project/ash_json_api/compare/v0.28.2...v0.28.3) (2021-05-19)




### Bug Fixes:

* handle nil route/json_api_prefix

## [v0.28.2](https://github.com/ash-project/ash_json_api/compare/v0.28.1...v0.28.2) (2021-05-09)




### Improvements:

* update to latest ash

## [v0.28.1](https://github.com/ash-project/ash_json_api/compare/v0.28.0...v0.28.1) (2021-04-10)




### Bug Fixes:

* accept arguments with attributes properly

## [v0.28.0](https://github.com/ash-project/ash_json_api/compare/v0.27.6...v0.28.0) (2021-04-10)




### Features:

* update relationship logic to new argument style

## [v0.27.6](https://github.com/ash-project/ash_json_api/compare/v0.27.5...v0.27.6) (2021-04-08)




### Bug Fixes:

* update dependency on ash

## [v0.27.5](https://github.com/ash-project/ash_json_api/compare/v0.27.4...v0.27.5) (2021-03-29)




### Bug Fixes:

* remove references to `join_attributes`

* properly include relationships

* serialize public relationships

### Improvements:

* update to latest ash

## [v0.27.4](https://github.com/ash-project/ash_json_api/compare/v0.27.3...v0.27.4) (2021-02-23)




### Bug Fixes:

* properly set ash version

## [v0.27.3](https://github.com/ash-project/ash_json_api/compare/v0.27.2...v0.27.3) (2021-02-23)




### Improvements:

* support latest Ash version

## [v0.27.2](https://github.com/ash-project/ash_json_api/compare/v0.27.1...v0.27.2) (2021-02-23)




### Improvements:

* support latest Ash version

## [v0.27.1](https://github.com/ash-project/ash_json_api/compare/v0.27.0...v0.27.1) (2021-01-22)




### Bug Fixes:

* support all types in json schema

* properly fetch router in `forward/2`

## [v0.27.0](https://github.com/ash-project/ash_json_api/compare/v0.26.0-rc0...v0.27.0) (2021-01-22)




### Improvements:

* support latest ash

## [v0.26.0-rc0](https://github.com/ash-project/ash_json_api/compare/v0.25.0...v0.26.0-rc0) (2021-01-22)




### Features:

* support latest ash

* support query arg in path/query params

## [v0.25.0](https://github.com/ash-project/ash_json_api/compare/v0.24.4...v0.25.0) (2021-01-12)




### Features:

* support embedded resources (as simple maps)

### Bug Fixes:

* fix delimiter spelling

## [v0.24.4](https://github.com/ash-project/ash_json_api/compare/v0.24.3...v0.24.4) (2021-01-06)




## [v0.24.3](https://github.com/ash-project/ash_json_api/compare/v0.24.2...v0.24.3) (2021-01-06)




### Bug Fixes:

* support latest ash aggregate functions

* support latest ash version

### Improvements:

* update to latest ash

## [v0.24.2](https://github.com/ash-project/ash_json_api/compare/v0.24.1...v0.24.2) (2020-12-02)




### Improvements:

* support arguments in post/patch payloads

## [v0.24.1](https://github.com/ash-project/ash_json_api/compare/v0.24.0...v0.24.1) (2020-11-24)




### Bug Fixes:

* handle accept and content-type properly

## [v0.24.0](https://github.com/ash-project/ash_json_api/compare/v0.23.0...v0.24.0) (2020-11-09)




### Features:

* only use public attributes for json_api (#45)

## [v0.23.0](https://github.com/ash-project/ash_json_api/compare/v0.22.0...v0.23.0) (2020-10-28)




### Features:

* support multitenancy (#44)

## [v0.22.0](https://github.com/ash-project/ash_json_api/compare/v0.21.0...v0.22.0) (2020-10-21)




### Features:

* support `required` in belongs_to relationship (#41)

* Support custom primary keys (#42)

## [v0.21.0](https://github.com/ash-project/ash_json_api/compare/v0.20.0...v0.21.0) (2020-10-12)




### Features:

* support latest ash pagination features

## [v0.20.0](https://github.com/ash-project/ash_json_api/compare/v0.19.0...v0.20.0) (2020-10-10)




### Features:

* support the `accept` configuration on actions

* move to latest ash

### Bug Fixes:

* support the latest ash version

* don't be so strict about ash dependency

## [v0.19.0](https://github.com/ash-project/ash_json_api/compare/v0.18.0...v0.19.0) (2020-09-02)




### Features:

* ash v1.11 (#32)

### Bug Fixes:

* load properly on nested routes (#36)

* support routes w/o route params

* actually forward to the configured path

* only render links at appropriate times

* error while fetching record from path

## [v0.18.0](https://github.com/ash-project/ash_json_api/compare/v0.17.0...v0.18.0) (2020-08-18)




### Features:

* update to latest ash

### Bug Fixes:

* array type support in json_schema

* modernize side_load calls

## [v0.17.0](https://github.com/ash-project/ash_json_api/compare/v0.16.0...v0.17.0) (2020-08-17)




### Features:

* support aggregates

* support array types

### Bug Fixes:

* make primary key id requirement explicit

## [v0.16.0](https://github.com/ash-project/ash_json_api/compare/v0.15.0...v0.16.0) (2020-08-10)




### Features:

* update to latest ash

## [v0.15.0](https://github.com/ash-project/ash_json_api/compare/0.14.0...v0.15.0) (2020-07-24)




### Features:

* update to latest ash

## [v0.14.0](https://github.com/ash-project/ash_json_api/compare/0.13.0...v0.14.0) (2020-07-23)




### Features:

* update to latest ash

## [v0.13.0](https://github.com/ash-project/ash_json_api/compare/0.12.0...v0.13.0) (2020-07-20)




### Features:

* update to the latest ash

## [v0.12.0](https://github.com/ash-project/ash_json_api/compare/0.11.1...v0.12.0) (2020-07-16)




### Features:

* update to latest ash

## [v0.11.1](https://github.com/ash-project/ash_json_api/compare/0.11.0...v0.11.1) (2020-07-15)




### Bug Fixes:

* *actually* upgrade to latest ash

## [v0.11.0](https://github.com/ash-project/ash_json_api/compare/0.10.0...v0.11.0) (2020-07-15)




### Features:

* update to latest ash

## [v0.10.0](https://github.com/ash-project/ash_json_api/compare/0.9.0...v0.10.0) (2020-07-13)




### Features:

* upgrade to latest ash

## [v0.9.0](https://github.com/ash-project/ash_json_api/compare/0.8.0...v0.9.0) (2020-07-09)




### Features:

* update to latest ash

## [v0.8.0](https://github.com/ash-project/ash_json_api/compare/0.7.0...v0.8.0) (2020-07-08)




### Features:

* update to latest ash

## [v0.7.0](https://github.com/ash-project/ash_json_api/compare/0.6.0...v0.7.0) (2020-07-08)




### Features:

* update to latest ash

## [v0.6.0](https://github.com/ash-project/ash_json_api/compare/0.5.0...v0.6.0) (2020-06-29)




### Features:

* update to latest ash

* update to latest ash

## [v0.5.0](https://github.com/ash-project/ash_json_api/compare/0.4.0...v0.5.0) (2020-06-29)




### Features:

* upgrade to latest ash

## [v0.4.0](https://github.com/ash-project/ash_json_api/compare/0.3.0...v0.4.0) (2020-06-27)




### Features:

* update to latest ash

### Bug Fixes:

* json_schema issues

## [v0.3.0](https://github.com/ash-project/ash_json_api/compare/0.2.4...v0.3.0) (2020-06-19)




### Features:

* upgrade to ash 0.6.0

## [v0.2.4](https://github.com/ash-project/ash_json_api/compare/0.2.3...v0.2.4) (2020-06-16)




## [v0.2.3](https://github.com/ash-project/ash_json_api/compare/0.2.2...v0.2.3) (2020-06-16)




### Bug Fixes:

* router calls in tests

## [v0.2.2](https://github.com/ash-project/ash_json_api/compare/0.2.1...v0.2.2) (2020-06-16)




### Bug Fixes:

* router/module name issues

## [v0.2.1](https://github.com/ash-project/ash_json_api/compare/0.2.0...v0.2.1) (2020-06-15)




### Bug Fixes:

* update .formatter.exs

## [v0.2.0](https://github.com/ash-project/ash_json_api/compare/0.1.5...v0.2.0) (2020-06-14)




### Features:

* use new dsl builder (#29)

## [v0.1.5](https://github.com/ash-project/ash_json_api/compare/0.1.4...v0.1.5) (2020-06-11)




### Bug Fixes:

* put test schema in `lib/` directory

## [v0.1.4](https://github.com/ash-project/ash_json_api/compare/0.1.3...v0.1.4) (2020-06-05)




### Bug Fixes:

* adjust tests/code for name/type removal

* account for name/type removal

## [v0.1.3](https://github.com/ash-project/ash_json_api/compare/0.1.2...v0.1.3) (2020-06-03)

This release is a test of the automated hex release package
