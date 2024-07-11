#!/bin/bash
if [ $# -eq 0 ]; then
    cd $HOME
else
    cd $@
fi