#!/usr/bin/env bash
nb=0
for R in $(seq 0 20 255); do
    for G in $(seq 0 20 255); do
        for B in $(seq 0 20 255); do
            nb=$((nb+1));
        done
    done
done

printf "${nb}";
