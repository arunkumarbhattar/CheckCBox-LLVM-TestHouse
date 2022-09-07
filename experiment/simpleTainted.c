#include <stdlib_tainted.h>
#include <string_tainted.h>
#include <stdio_tainted.h>
#include <stdint.h> /* Needed for SIZE_MAX */


typedef _Tainted Tstruct json_object_t_t TJSON_Object;
typedef _Tainted Tstruct json_array_t_t  TJSON_Array;
typedef _Tainted Tstruct json_value_t_t  TJSON_Value;

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

/* Type definitions */
typedef _Tainted Tstruct json_value_value_t_t {
_TNt_array_ptr<char> string;
double       number;
_TPtr<TJSON_Object> object;
_TPtr<TJSON_Array> array;
int          boolean;
int          null;
} TJSON_Value_Value;

_Tainted Tstruct json_value_t_t {
_TPtr<TJSON_Value> parent;
JSON_Value_Type  type;
TJSON_Value_Value value;
};

_Tainted Tstruct json_object_t_t {
_TPtr<TJSON_Value> wrapping_value;
_TArray_ptr<_TNt_array_ptr<char>> names : count(capacity);
_TArray_ptr<_TPtr<TJSON_Value>> values  : count(capacity);
size_t       count;
size_t       capacity;
};

_Tainted Tstruct json_array_t_t {
_TPtr<TJSON_Value> wrapping_value;
_TArray_ptr<_TPtr<TJSON_Value>> items : count(capacity);
size_t       count;
size_t       capacity;
};


_Decoy typedef _Tainted Tstruct Spl_json_value_value_t_t {
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


Spl_TJSON_Value_Value Spl_TJSON_Value_Value_Val;

Tstruct Spl_json_value_t_t Spl_json_value_t_t_Val;
Tstruct Spl_json_object_t_t Spl_json_object_t_t_Val;

Tstruct Spl_json_array_t_t Spl_json_array_t_t_Val;

Spl_TJSON_Value_Value Dummy_Spl_TJSON_Value_Value(void);
Tstruct Spl_json_value_t_t Dummy_Spl_json_value_t_t(void);
Tstruct Spl_json_object_t_t Dummy_Spl_json_object_t_t(void);
Tstruct Spl_json_array_t_t Dummy_Spl_json_array_t_t(void);

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

//
//_Tainted _TNt_array_ptr<char> parson_string_tainted_malloc(size_t sz) : count(sz) _Unchecked{
//if(sz >= SIZE_MAX)
//return NULL;
//_TArray_ptr<char> p : count(sz+1) = (_TArray_ptr<char>)t_malloc<char>(sz + 1);
//if (p != NULL)
//p[sz] = 0;
//return _Tainted_Assume_bounds_cast<_TNt_array_ptr<char>>(p, count(sz));
//}

//_TLIB
//_TNt_array_ptr<char> read_file(_TNt_array_ptr<const char> filename) _Unchecked{
//	FILE* fp = (FILE*)fopen((const char *)filename, "r");
//	size_t size_to_read = 0;
//	size_t size_read = 0;
//	long pos;
//
//	if (!fp) {
//		return NULL;
//	}
//	fseek(fp, 0L, SEEK_END);
//	pos = ftell(fp);
//	if (pos < 0) {
//		fclose(fp);
//		return NULL;
//	}
//	size_to_read = pos;
//	rewind(fp);
//	// TODO: compiler isn't constant folding when checking bounds, so we need the spurious (size_t) 1 here.
//	_TNt_array_ptr<char> file_contents : count((size_t) 1 * size_to_read) = parson_string_tainted_malloc((size_t) 1 * size_to_read );
//	if (!file_contents) {
//		fclose(fp);
//		return NULL;
//	}
//	size_read = fread((void*)file_contents, 1, size_to_read, fp);
//	if (size_read == 0 || ferror(fp)) {
//		fclose(fp);
//		return NULL;
//	}
//	fclose(fp);
//	file_contents[size_read] = '\0';
//	return file_contents;
//}
//_Tainted _TPtr<TJSON_Value> parse_string_value(_TNt_array_ptr<const char> string,
//_TPtr<_TNt_array_ptr<char>(_TNt_array_ptr<const char> input : count(len),
//        size_t len)> process_string);
//
//_Callback static _TNt_array_ptr<char> process_string(_TNt_array_ptr<const char> input : count(len), size_t len) {
//    parse_string_value(input, &process_string);
//    return input;
//}
//
//_Tainted _TPtr<TJSON_Value> parse_string_value(_TNt_array_ptr<const char> string,
//_TPtr<_TNt_array_ptr<char>(_TNt_array_ptr<const char> input : count(len),
//        size_t len)> process_string)
//{
//
//}
_Mirror JSON_Value_Type json_value_get_type   (_TPtr<const TJSON_Value> value)_Checked {
return value ? value->type : JSONError;
}

_Mirror _TPtr<TJSON_Object> json_value_get_object(_TPtr<const TJSON_Value> value) _Checked {
return json_value_get_type(value) == JSONObject ? value->value.object : NULL;
}

int main()
{

    return 0;
}

