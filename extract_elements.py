#!/usr/bin/env python3
"""
สคริปต์สำหรับแยก element information จาก Robot Framework log
"""
import re
from pathlib import Path

def extract_element_info_from_log(log_file_path):
    """อ่านและแยกข้อมูล element จาก log file"""
    try:
        with open(log_file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # หาข้อมูล input elements
        input_pattern = r'Input \d+: type=([^,]*), id=([^,]*), name=([^,]*), class=([^<]*)'
        input_matches = re.findall(input_pattern, content)
        
        print("=== INPUT ELEMENTS ===")
        for i, (type_attr, id_attr, name_attr, class_attr) in enumerate(input_matches):
            print(f"Input {i}:")
            print(f"  Type: {type_attr}")
            print(f"  ID: {id_attr}")
            print(f"  Name: {name_attr}")
            print(f"  Class: {class_attr}")
            print()
        
        # หาข้อมูล button elements
        button_pattern = r'Button \d+: type=([^,]*), id=([^,]*), text=([^,]*), class=([^<]*)'
        button_matches = re.findall(button_pattern, content)
        
        print("=== BUTTON ELEMENTS ===")
        for i, (type_attr, id_attr, text, class_attr) in enumerate(button_matches):
            print(f"Button {i}:")
            print(f"  Type: {type_attr}")
            print(f"  ID: {id_attr}")
            print(f"  Text: {text}")
            print(f"  Class: {class_attr}")
            print()
            
    except FileNotFoundError:
        print(f"ไม่พบไฟล์ log: {log_file_path}")
    except Exception as e:
        print(f"เกิดข้อผิดพลาด: {e}")

if __name__ == "__main__":
    log_path = Path("log.html")
    extract_element_info_from_log(log_path)