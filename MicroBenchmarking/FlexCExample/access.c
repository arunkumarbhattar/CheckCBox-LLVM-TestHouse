#include "access.h"

_Tainted _TPtr<int> SimpleTaintedFunction(_TPtr<int> a, _TPtr<int> b, 
		_TPtr<int> (*func_1)(_TPtr<int>a, _TPtr<int>b),
		_TPtr<int> (*func_2)(_TPtr<int>a, _TPtr<int>b),
		_TPtr<int> (*func_3)(_TPtr<int>a, _TPtr<int>c))
{
	if (*a == *b)
		return func_1(a, b);
	else if (*a > *b)
		return func_2(a, b);
	else
		return func_3(a, b);

}

_Tainted _TPtr<int> callbackFunction(_TPtr<int> a, _TPtr<int> b)
{
	printf("Callback Called\n");
	return a;
}


_TPtr<int> checkedFunction(_TPtr<int> a, _TPtr<int> b)
{
	printf("Checked Function called\n");
	return b;
}

_Tainted _TPtr<int> taintedFunction(_TPtr<int> a, _TPtr<int> b)
{
	printf("Tainted Function called\n");
}


int main() {

    _TPtr<int> a = hoard_malloc<int>(sizeof(int));
    _TPtr<int> b = hoard_malloc<int>(sizeof(int));

    //below is legal
    *a = 1;
    *b = 1;
    SimpleTaintedFunction(a, b, taintedFunction, checkedFunction, callbackFunction);

    registerCallback(callbackFunction);
    *a = 10;
    *b = 20;
    SimpleTaintedFunction(a, b, taintedFunction, checkedFunction, callbackFunction);
    unregisterCallback(callbackFunction);
    //expect crash here 
    *a = 20;
    *b = 10;
    SimpleTaintedFunction(a, b, taintedFunction, checkedFunction, callbackFunction);

    return 0;

}
