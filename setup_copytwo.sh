#!/bin/bash

# Basically you can define functions and they act like little scripts where $0, $1, $2,... etc, $* and the like get set as the arguments
# you "call them with", on the shell that's like running a command

# Written by Iris Johnson, July 2020

# I'm not sure if you really wanted a loop through various extensions or just the two so this is the loop
# bash sucks as a scripting language, I made comments since really it's just weird syntax mostly.

function copytwo {
  # Bash has weird variable rules because of course it does, use "local"
  # these are really just constants to make it clearer
  local remote_host="$2"#"rulinux03.dhcp.fnal.gov"
  
  # If really the only changing thing is the timestamp we just take the timestamp as the first argument which is in $1
  # Everything is quoted because I don't know, it makes me feel better
  local source_prefix="$1"#"captan_plus_ddcp/top/top.runs/impl_1/top"
  local destination_prefix="$3"#"pipii_ddcp_bitfiles/captan_plus_bare_ddcp_"
  local destination_suffix="$4"#"$1"
  
  # there are multiple ways to define the set of extensions we use
  # I think it's easiest to use a proper array which is setup like this (note the use of spaces)
  local extensions=(".bit" ".ltx" ".mcs")
  
  # Now loop, array loops mostly use the weird syntax of "${varname[@]}", (including the double quotes)
  # this expands into a sequence of words where each entry gets quoted, making spaces not break the loop
  for ext in "${extensions[@]}"
  do
    # ${varname} is safe even if varname has spaces or would bleed into the rest of the line
    # double-quotes allow spaces in the filename, I use both for consistency
    scp "${source_prefix}${ext}" "${remote_host}:${destination_prefix}${destination_suffix}${ext}"
  done
} # end of copytwo

# Invoke using copytwo <name/timestamp suffix you want to use>
