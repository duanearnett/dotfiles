#!/bin/bash
echo $(timew summary work | tail -n 2 | tr -d ' ' | head -n 1)
