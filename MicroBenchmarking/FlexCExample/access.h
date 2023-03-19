//
// Created by supercharger on 3/15/23.
//

#ifndef MYPROJECT_ACCESS_H
#define MYPROJECT_ACCESS_H
#include <checkcbox_extensions.h>

_Itype_for_any(T) _TPtr<T> hoard_malloc(size_t size);
_Tainted _TPtr<int> SimpleTaintedFunction(_TPtr<int> a, _TPtr<int> b,
        _TPtr<int> (*func_1)(_TPtr<int>a, _TPtr<int>b),
        _TPtr<int> (*func_2)(_TPtr<int>a, _TPtr<int>b),
        _TPtr<int> (*func_3)(_TPtr<int>a, _TPtr<int>c));
_Callback _TPtr<int> callbackFunction(_TPtr<int> a, _TPtr<int> b);
_TPtr<int> checkedFunction(_TPtr<int> a, _TPtr<int> b);
_Tainted  _TPtr<int> taintedFunction(_TPtr<int> a, _TPtr<int> b);

void registerCallback(void* callback);
void unregisterCallback(void* callback);
#endif //MYPROJECT_ACCESS_H
