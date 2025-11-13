#!/bin/bash

#if condition
echo "please enter the number :"
read number

if [ number -gt 10 ];then
    echo "the number is greater than $number"
else
     echo "the given number is not greater than $number" 
fi





