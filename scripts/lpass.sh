#!/bin/bash

function lpf()
{
  lpass ls | grep -i $1
}


function lpy()
{
  lpass show $1 --password | pbcopy
}
