#include <stdlib_tainted.h>
#include <checkcbox_extensions.h>

#define parson_tainted_malloc(t, sz) (t_malloc<t>(sz))
#define parson_tainted_free(t, p)   (t_free<t>(_Tainted_Dynamic_bounds_cast<_TArray_ptr<t>>(p, byte_count(0))))
/* Type definitions */
typedef _Tainted Tstruct json_object_t_t TJSON_Object;
typedef _Tainted Tstruct json_array_t_t  TJSON_Array;
typedef _Tainted Tstruct json_value_t_t  TJSON_Value;
typedef _Tainted Tstruct json_value_value_t_t TJSON_Value_Value;
_Tainted const enum json_value_type {
    JSONError   = -1,
    JSONNull    = 1,
    JSONString  = 2,
    JSONNumber  = 3,
    JSONObject  = 4,
    JSONArray   = 5,
    JSONBoolean = 6
};
typedef int JSON_Value_Type;

_Tainted const enum json_result_t {
    JSONSuccess = 0,
    JSONFailure = -1
};
typedef int JSON_Status;


typedef _Tainted Tstruct json_object_t_t {
    _TPtr<TJSON_Value> wrapping_value;
    _TArray_ptr<_TNt_array_ptr<char>> names : count(capacity);
    _TArray_ptr<_TPtr<TJSON_Value>> values  : count(capacity);
    size_t       count;
    size_t       capacity;
}TJSON_Object;

typedef _Tainted Tstruct json_array_t_t {
    _TPtr<TJSON_Value> wrapping_value;
    _TArray_ptr<_TPtr<TJSON_Value>> items : count(capacity);
    size_t       count;
    size_t       capacity;
}TJSON_Array;

typedef _Tainted Tstruct json_value_value_t_t {
_TNt_array_ptr<char> string;
double       number;
_TPtr<TJSON_Object> object;
_TPtr<TJSON_Array> array;
int          boolean;
int          null;
} TJSON_Value_Value;

typedef _Tainted Tstruct json_value_t_t {
_TPtr<TJSON_Value> parent;
JSON_Value_Type  type;
TJSON_Value_Value value;
}TJSON_Value;

//
//_Tainted _TPtr<TJSON_Array> json_array_init(_TPtr<TJSON_Value> wrapping_value) {
//    _TPtr<TJSON_Array> new_array = parson_tainted_malloc(TJSON_Array, sizeof(TJSON_Array));
//    if (new_array == NULL) {
//    return NULL;
//    }
//    new_array->wrapping_value = wrapping_value;
//    new_array->items = NULL;
//    _Unchecked
//    {
//        new_array->capacity = 0;
//        new_array->count = 9000;
//    };
//    return new_array;
//}


typedef _Decoy _Tainted Tstruct Spl_json_value_value_t_t {
        unsigned int string;
        unsigned int       number;
        unsigned int object;
        unsigned int array;
        int          boolean;
        int          null;
} Spl_TJSON_Value_Value;

_Decoy _Tainted Tstruct Spl_json_value_t_t {
        unsigned int parent;
        JSON_Value_Type  type;
        Spl_TJSON_Value_Value value;
};

_Decoy _Tainted Tstruct Spl_json_object_t_t {
        unsigned int wrapping_value;
        unsigned int names;
        unsigned int values;
        unsigned int count;
        unsigned int capacity;
};

_Decoy _Tainted Tstruct Spl_json_array_t_t {
        unsigned int wrapping_value;
        unsigned int items ;
        unsigned int count;
        unsigned int capacity;
};


Spl_TJSON_Value_Value Dummy_Spl_TJSON_Value_Value(void);

Spl_TJSON_Value_Value Spl_TJSON_Value_Value_Val;
Tstruct Spl_json_value_t_t Spl_json_value_t_t_Val;
Tstruct Spl_json_object_t_t Spl_json_object_t_t_Val;
Tstruct Spl_json_array_t_t Spl_json_array_t_t_Val;



Tstruct Spl_json_value_t_t Dummy_Spl_json_value_t_t(void);
Tstruct Spl_json_object_t_t Dummy_Spl_json_object_t_t(void);
Tstruct Spl_json_array_t_t Dummy_Spl_json_array_t_t(void);

Tstruct Spl_json_array_t_t Spl_json_array_t_t_Val;

Tstruct Spl_json_value_t_t Spl_json_value_t_t_Val;

//Now we declare Dummy functions for the Decoy TStruct Types, just that LLVM gets tricked into thinking that the TStructs are used somewhere in the code

_TLIB
        Spl_TJSON_Value_Value Dummy_Spl_TJSON_Value_Value(void) {
    return Spl_TJSON_Value_Value_Val;
}
_TLIB
        Tstruct Spl_json_value_t_t Dummy_Spl_json_value_t_t(void) {
    return Spl_json_value_t_t_Val;
}
_TLIB
        Tstruct Spl_json_object_t_t Dummy_Spl_json_object_t_t(void) {
    return Spl_json_object_t_t_Val;
}
_TLIB
        Tstruct Spl_json_array_t_t Dummy_Spl_json_array_t_t(void) {
    return Spl_json_array_t_t_Val;
}
_Tainted _TPtr<TJSON_Value> json_value_init_array  (void) {


    return (_TPtr<TJSON_Value>)(w2c_json_value_init_array( c_fetch_sandbox_address()));
}
// Driver code
 int main(void)
{
	_TPtr<TJSON_Value> TJMAXX = json_value_init_array();
    t_printf("JSON Type Val Array Count %d", (TJMAXX->value.array->count));
	return 0;
}

