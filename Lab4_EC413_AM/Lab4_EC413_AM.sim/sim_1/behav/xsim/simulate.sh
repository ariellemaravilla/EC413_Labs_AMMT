#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2024.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sat Feb 22 23:55:30 EST 2025
# SW Build 5076996 on Wed May 22 18:36:09 MDT 2024
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_CSA64_behav -key {Behavioral:sim_1:Functional:tb_CSA64} -tclbatch tb_CSA64.tcl -log simulate.log"
xsim tb_CSA64_behav -key {Behavioral:sim_1:Functional:tb_CSA64} -tclbatch tb_CSA64.tcl -log simulate.log

