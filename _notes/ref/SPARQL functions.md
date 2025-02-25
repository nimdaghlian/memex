---
layout: note
---

### 1. String Functions
- STR(?var): Converts an IRI or literal to a string.
- STRLEN(?str): Returns the length of a string.
- CONTAINS(?str, "substring"): Checks if a string contains a substring.
- STRSTARTS(?str, "prefix"): Checks if a string starts with a prefix.
- STRENDS(?str, "suffix"): Checks if a string ends with a suffix.
- SUBSTR(?str, start, length): Extracts a substring from a string.
- UCASE(?str): Converts a string to uppercase.
- LCASE(?str): Converts a string to lowercase.
- REPLACE(?str, "pattern", "replacement"): Replaces parts of a string.

### 2. Numeric Functions
- ABS(?num): Returns the absolute value of a number.
- ROUND(?num): Rounds a number to the nearest integer.
- CEIL(?num): Rounds a number up to the nearest integer.
- FLOOR(?num): Rounds a number down to the nearest integer.
- RAND(): Returns a random number between 0 and 1.

### 3. Date and Time Functions
- NOW(): Returns the current date and time.
- YEAR(?date): Extracts the year from a date.
- MONTH(?date): Extracts the month from a date.
- DAY(?date): Extracts the day from a date.

### 4. Type Conversion Functions
- STRDT(?str, datatype): Converts a string to a typed literal.
- STRLANG(?str, "lang"): Adds a language tag to a string.
- DATATYPE(?literal): Returns the datatype of a literal.

### 5. Logical Functions
- BOUND(?var): Checks if a variable is bound (has a value).
- IF(condition, trueValue, falseValue): Returns one of two values based on a condition.

### 6. Aggregation Functions
- COUNT(?var): Counts the number of values.
- SUM(?var): Calculates the sum of numeric values.
- AVG(?var): Calculates the average of numeric values.
- MIN(?var): Finds the minimum value.
- MAX(?var): Finds the maximum value.

### 7. URI Functions
- URI(?str): Creates a URI from a string.
- IRI(?str): Creates an IRI from a string (similar to URI).

### 8. Miscellaneous Functions
- COALESCE(?var1, ?var2, ...): Returns the first non-null value in a list.
- ISURI(?var): Checks if a variable is a URI.
- ISLITERAL(?var): Checks if a variable is a literal.