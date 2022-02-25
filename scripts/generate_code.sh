#!/bin/bash

rm -rf fugue_sql_antlr/_parser
mkdir -p fugue_sql_antlr/_parser

antlr4="java -Xmx500M -cp bin/antlr-4.9.3-complete.jar org.antlr.v4.Tool"

$antlr4 -Dlanguage=Cpp -visitor -no-listener -o fugue_sql_antlr/_parser/cpp fugue_sql.g4

$antlr4 -Dlanguage=Python3 -visitor -no-listener -o fugue_sql_antlr/_parser fugue_sql.g4

rm fugue_sql_antlr/_parser/*.interp
rm fugue_sql_antlr/_parser/*.tokens

touch fugue_sql_antlr/_parser/__init__.py

python scripts/sa_wrapper.py
