# sumi[![Build Status](https://travis-ci.org/ynishi/sumi.svg?branch=master)](https://travis-ci.org/ynishi/sumi)
sum of int list from stdin

## install
```
stack install
```
## Usage
```
echo "
1
a
2
3
"| sumi
# 6
```
### Options
* wip 
```
-f --func
  func of fold
example:
  echo "1 2 3" |sumi -f '*'
  # 6(1 * 2 * 3)
```
