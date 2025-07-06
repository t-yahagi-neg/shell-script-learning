#!/bin/bash

countries=(Japan France Germany Finland)

unset countries[1]

echo ${countries[0]}
echo ${countries[1]}
echo ${countries[2]}
echo ${countries[3]}
