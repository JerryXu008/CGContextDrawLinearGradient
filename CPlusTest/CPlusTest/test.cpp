//
//  test.cpp
//  CPlusTest
//
//  Created by song on 15/2/13.
//  Copyright (c) 2015年 song. All rights reserved.
//

#include "test.h"
#include <iostream>
using namespace std;


int StringBad::num_strings=0;


StringBad::StringBad(const char *s){
    len=std::strlen(s);
    str=new char[len+1];
    std::strcpy(str,s);
    num_strings++;

}
StringBad::StringBad(const StringBad & st)
{
    num_strings++;
    len=st.len;
    str=new char[len+1];
    std:strcpy(str, st.str);
    strcpy(str, "fdsfds");
    char *aa=new char[10];
  
    delete []aa;
    int *p=nullptr;
    
    char temp[]="fdsfds";
    string ss=temp;
}


StringBad::StringBad()                // default constructor
{
    len = 4;
    str = new char[4];
    std::strcpy(str, "C++");          // default string
    num_strings++;
    cout << num_strings << ": \"" << str
    << "\" default object created\n";  // FYI
}
StringBad & StringBad::operator=(const StringBad &st)
{
    if(this==&st) return *this;
    delete []this->str;
    len=st.len;
    str=new char[len+1];
    std::strcpy(str, st.str);
    return *this;
}

StringBad::~StringBad(){
    --num_strings;
    cout<<num_strings;
    delete []str;

}

std::ostream & operator<<(std::ostream & os, const StringBad & st)
{
    os << st.str;
 
    
    return os;
}
