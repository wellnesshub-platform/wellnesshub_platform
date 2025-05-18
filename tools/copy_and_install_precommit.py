import os
import shutil
import subprocess

ROOT_DIR = "/Users/himanshushukla/projects/wellnesshub_platform"
SOURCE_FILE = os.path.join(ROOT_DIR, "ux", "pre-commit.yaml")


def copy_and_install():
    if not os.path.exists(SOURCE_FILE):
        print(f"❌ Source file not found: {SOURCE_FILE}")
        return

    for module in os.listdir(ROOT_DIR):
        module_path = os.path.join(ROOT_DIR, module)
        if os.path.isdir(module_path) and module not in ["ux", "doc", "tools"]:
            dest_file = os.path.join(module_path, "pre-commit.yaml")
            shutil.copy2(SOURCE_FILE, dest_file)
            print(f"✅ Copied to: {dest_file}")

            # Install pre-commit hook using venv if available
            venv_bin = os.path.join(module_path, ".venv", "bin", "pre-commit")
            pre_commit_cmd = venv_bin if os.path.exists(venv_bin) else "pre-commit"

            try:
                subprocess.run(
                    [pre_commit_cmd, "install", "--config", "pre-commit.yaml"],
                    cwd=module_path,
                    check=True,
                )
                print(f"🔧 Installed pre-commit hook in {module_path}")
            except Exception as e:
                print(f"⚠️  Failed to install pre-commit in {module_path}: {e}")


if __name__ == "__main__":
    copy_and_install()
