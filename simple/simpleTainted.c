#include <stdlib_tainted.h>
#include <checkcbox_extensions.h>
typedef Tstruct SuperNestedHeader{
_TPtr<char> brother_name;
}SNHDD;

typedef Tstruct nestedHeader{
_TPtr<char> name;
_TPtr<SNHDD> super_nested;
}NHDD;

typedef Tstruct Header{
_TPtr<int> twin_turbo;
_TPtr<NHDD> nested;
}HDD;

_TLIB
_TPtr<int> simple_tainted_func(void)
{
	_TPtr<int> tainted_ptr = (_TPtr<int>)t_malloc<int>(sizeof(int));
       *tainted_ptr = 293;
	return tainted_ptr;
}

_TLIB
_TPtr<HDD> slightly_less_simple_tainted_func(_TPtr<int> ptr)
{
       _TPtr<HDD> hdd_val = (_TPtr<HDD>)t_malloc<HDD>(sizeof(HDD));
       _TPtr<char> my_name = (_TPtr<char>)t_malloc<char>(20*sizeof(char));
       t_strcpy(my_name, "Arunkumar Bhattar");
       hdd_val->nested = (_TPtr<NHDD>)t_malloc<NHDD>(sizeof(NHDD));
       hdd_val->nested->name = my_name;
       hdd_val->twin_turbo = ptr;
       return hdd_val;       
}

_TLIB
void call_only_func(void)
{
	_TPtr<int> basic = (_TPtr<int>)t_malloc<int>(sizeof(int));
}

_TLIB
_TPtr<HDD> tainted_func(_TPtr<HDD> hdd_val)
{
       hdd_val->nested->super_nested = (_TPtr<SNHDD>)t_malloc<SNHDD>(sizeof(SNHDD));
       _TPtr<char> bro_name = (_TPtr<char>)t_malloc<char>(20*sizeof(char));
       t_strcpy(bro_name, "Varun Kumar Bhattar");
       hdd_val->nested->super_nested->brother_name = bro_name;       
       return hdd_val;
}
// Driver code
 int main(void)
{
	_TPtr<int> c1 = simple_tainted_func();
	_TPtr<HDD> c2 = slightly_less_simple_tainted_func(c1);
	t_printf("HDD Member twin_turbo Val %d", *(c2->twin_turbo));
	t_printf("NHDD Member name Val %s", c2->nested->name);
	call_only_func();
	c2 = tainted_func(c2);
	t_printf("SNHDD Member name Val %s", c2->nested->super_nested->brother_name);
	return 0;
}

