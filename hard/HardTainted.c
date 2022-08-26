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

typedef _Tainted Tstruct json_value_t_t {
    _TPtr<TJSON_Value> parent;
    JSON_Value_Type  type;
    _TPtr<TJSON_Value_Value> value;
}TJSON_Value;

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

_Tainted _TPtr<TJSON_Array> json_array_init(_TPtr<TJSON_Value> wrapping_value) {
    _TPtr<TJSON_Array> new_array = parson_tainted_malloc(TJSON_Array, sizeof(TJSON_Array));
    if (new_array == NULL) {
    return NULL;
    }
    new_array->wrapping_value = wrapping_value;
    new_array->items = NULL;
    _Unchecked
    {
        new_array->capacity = 0;
        new_array->count = 9000;
    };
    return new_array;
}


_Tainted _TPtr<TJSON_Value> json_value_init_array  (void) {
    _TPtr<TJSON_Value> new_value = parson_tainted_malloc(TJSON_Value, sizeof(TJSON_Value));
    if (!new_value) {
        return NULL;
    }
    new_value->parent = NULL;
    new_value->type = JSONArray;
    new_value->value->array = json_array_init(new_value);
    if (!new_value->value->array) {
        parson_tainted_free(TJSON_Value, new_value);
        return NULL;
    }
    return new_value;
}
// Driver code
 int main(void)
{
	_TPtr<TJSON_Value> TJMAXX = json_value_init_array();
    t_printf("JSON Type Val %d", TJMAXX->type);
    t_printf("JSON Type Val %d", TJMAXX->value->array->count);
	return 0;
}

