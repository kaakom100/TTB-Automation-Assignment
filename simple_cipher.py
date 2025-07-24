def simpleCipher(encrypted: str, k: int) -> str:
    """
    ถอดรหัส โดยเลื่อนตัวอักษรไปข้างหลัง k ตัว (A-Z วนรอบ)
    """
    decrypted = ""
    for c in encrypted:
        shifted = (ord(c) - ord('A') - k) % 26
        decrypted += chr(ord('A') + shifted)
    return decrypted

# ----- Example -----
def test_example():
    assert simpleCipher("VTAOG", 2) == "TRYME"
    assert simpleCipher("ZABC", 2) == "XYZA"
    assert simpleCipher("A", 1) == "Z"
    assert simpleCipher("B", 2) == "Z"

# ----- รันแบบ main -----
if __name__ == "__main__":
    print(simpleCipher("VTAOG", 2))  # TRYME
    # รัน test ได้ด้วย python simple_cipher.py

