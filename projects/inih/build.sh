#!/bin/bash -eu
# Copyright 2018 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################


cp $SRC/*.dict $OUT/
cp $SRC/*.zip $OUT/

for f in $SRC/*_fuzzer.cc; do
    fuzzer=$(basename "$f" _fuzzer.cc)
    $CXX $CXXFLAGS -std=c++11 -I$SRC/ \
         $SRC/${fuzzer}_fuzzer.cc $SRC/ini.c -o $OUT/${fuzzer}_fuzzer \
         -lFuzzingEngine
done