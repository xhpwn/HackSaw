#!/usr/bin/env python2

'''
    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    +                                                                   +
    +    @HackSaw_v3.0                                                  +
    +    @author Anubhav Saxena (xhpwn), |anubhav@saxena.xyz|           +
    +    @desc Compares input string with MD5 hash                      +
    +                                                                   +
    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'''

import hashlib

def compare(base, input2): # base -> MD5 hash | input2 -> string to compare
    
    hasher = hashlib.md5()
    hasher.update(input2) # Updates hasher with hash of input2

    if hasher.hexdigest() == base:
        return true
    else:
        return false
