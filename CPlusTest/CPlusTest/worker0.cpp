//
//  worker0.cpp
//  CPlusTest
//
//  Created by song on 15/3/6.
//  Copyright (c) 2015年 song. All rights reserved.
//

#include "worker0.h"
#include <iostream>
using std::cout;
using std::cin;
using std::endl;

Worker::~Worker(){}

void Worker::Set(){


}
void Worker::Show() const{

}

void Waiter::Set(){
    Worker::Set();

}
void Waiter::Show() const{
    Worker::Show();

}

char * Singer::pv[] = {"other", "alto", "contralto",
    "soprano", "bass", "baritone", "tenor"};

void Singer::Set(){
    Worker::Set();

}
void Singer::Show() const{
    Worker::Show();
}