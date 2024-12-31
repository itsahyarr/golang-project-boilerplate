# Golang Project Boilerplate Generator

## Description

A Golang boilerplate generator using repository pattern.

## Info

- Pattern used : repository pattern

## Features

- [x] Fiber based framework
- [x] NoSQL based database driver (MongoDB)
- [ ] SQL based database driver (PostgreSQL)
- [ ] SQL based database driver (MySQL)
- [ ] Gin based framework
- [ ] Echo based framework
- [x] Base CRUD interface
- [x] Generate module based on repository pattern

## Usage Documentation

### Example

> Create a module named "example"

`$ make module name=example`

> If module name is 2 or more words, please use camelCase without any space (refer to golang naming convention)

`$ make module name=multiWordModuleName`
