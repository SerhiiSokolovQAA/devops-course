#!/usr/bin/env bash
read -r -p "What is your name? " name
echo "Hello, ${name:-stranger}!"