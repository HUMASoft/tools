#!/bin/bash
id=$1
cansend vcan0 58$id#12
cansend vcan0 70$id#11
cansend vcan0 58$id#11