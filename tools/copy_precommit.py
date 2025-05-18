import os
import shutil

ROOT_DIR = "/Users/himanshushukla/projects/wellnesshub_platform"
SOURCE_FILE = os.path.join(ROOT_DIR, "ux", "pre-commit.yaml")


def copy_to_all_modules():
    if not os.path.exists(SOURCE_FILE):
        print(f"❌ Source file not found: {SOURCE_FILE}")
        return

    for module in os.listdir(ROOT_DIR):
        module_path = os.path.join(ROOT_DIR, module)
        if os.path.isdir(module_path) and module not in ["ux", "doc", "tools"]:
            dest_file = os.path.join(module_path, "pre-commit.yaml")
            shutil.copy2(SOURCE_FILE, dest_file)
            print(f"✅ Copied to: {dest_file}")


if __name__ == "__main__":
    copy_to_all_modules()
