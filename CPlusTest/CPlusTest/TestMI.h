//
//  TestMI.h
//  CPlusTest
//
//  Created by song on 15/3/6.
//  Copyright (c) 2015年 song. All rights reserved.
//

#ifndef __CPlusTest__TestMI__
#define __CPlusTest__TestMI__

#include <stdio.h>
class A{
protected:
  virtual  void get();

};
class B:virtual public A{
protected:
    virtual void get();
};
class C: virtual public A{
protected:
    virtual void get();
    
};
class D:public B,public C{
public:
    D():A(),B(),C(){}
    void get();
};
#endif /* defined(__CPlusTest__TestMI__) */
