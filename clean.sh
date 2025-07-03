#!/bin/bash

rm -rf \
  build \
  $(find ./src/ -type d -name mocks) \
  $(find ./src/ -type d -name runners) \
  $(find ./src/ -type f -name *_runner.c)
  
