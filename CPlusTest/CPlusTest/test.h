//
//  test.h
//  CPlusTest
//
//  Created by song on 15/2/13.
//  Copyright (c) 2015年 song. All rights reserved.
//

#ifndef __CPlusTest__test__
#define __CPlusTest__test__

#include <stdio.h>
#include <string>

class StringBad
{
private:
    char * str;                // pointer to string
    int len;                   // length of string
    static int num_strings;    // number of objects
    int aa[10];
public:
    StringBad(const char * s); // constructor
    StringBad(const StringBad & bad);
    StringBad();               // default constructor
    ~StringBad();              // destructor
    StringBad & operator=(const StringBad &st);
    // friend function
    friend std::ostream & operator<<(std::ostream & os,
                                     const StringBad & st);
};
//int waibu;
//int printA;
#endif /* defined(__CPlusTest__test__) */
