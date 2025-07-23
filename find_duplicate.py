def find_duplicate(list_a, list_b):
    """
    Return a list of duplicate items from list_a and list_b
    """
    return list(set(list_a) & set(list_b))

# Example
list_a = [1,2,3,5,6,8,9]
list_b = [3,2,1,5,6,0]
duplicate = find_duplicate(list_a, list_b)
print(duplicate)  
