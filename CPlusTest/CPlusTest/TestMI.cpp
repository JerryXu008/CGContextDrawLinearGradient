//
//  TestMI.cpp
//  CPlusTest
//
//  Created by song on 15/3/6.
//  Copyright (c) 2015年 song. All rights reserved.
//

#include "TestMI.h"
#include <iostream>
using namespace::std;
void A::get(){
  cout<<"A";

}
void B::get(){
 cout<<"B";
}
void C::get(){
cout<<"C";
}
void D::get(){
     A::get();
    
     cout<<"D";
}