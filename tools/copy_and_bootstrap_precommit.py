import shutil
import subprocess
from pathlib import Path

CURRENT_DIR = Path(__file__).resolve().parent
ROOT_DIR = CURRENT_DIR.parent
SOURCE_FILE = ROOT_DIR / "ux" / "pre-commit.yaml"
EXCLUDE_DIRS = {"ux", "doc", "tools"}


def ensure_venv(module_path):
    venv_path = module_path / ".venv"
    python_bin = venv_path / "bin" / "python"
    if not python_bin.exists():
        print(f"🔧 Creating venv in {module_path}...")
        subprocess.run(["python3", "-m", "venv", ".venv"], cwd=module_path, check=True)
    return python_bin


def install_precommit(python_bin, module_path):
    pip_bin = python_bin.parent / "pip"
    subprocess.run(
        [str(pip_bin), "install", "--upgrade", "pip"], cwd=module_path, check=True
    )
    subprocess.run([str(pip_bin), "install", "pre-commit"], cwd=module_path, check=True)

    precommit_bin = python_bin.parent / "pre-commit"
    subprocess.run(
        [str(precommit_bin), "install", "--config", "pre-commit.yaml"],
        cwd=module_path,
        check=True,
    )
    print(f"✅ Pre-commit setup completed in {module_path}")


def main():
    if not SOURCE_FILE.exists():
        print(f"❌ Missing: {SOURCE_FILE}")
        return

    for module in ROOT_DIR.iterdir():
        if module.is_dir() and module.name not in EXCLUDE_DIRS:
            dest_path = module / "pre-commit.yaml"
            shutil.copy2(SOURCE_FILE, dest_path)
            print(f"📄 Copied pre-commit.yaml to {module}")

            try:
                python_bin = ensure_venv(module)
                install_precommit(python_bin, module)
            except Exception as e:
                print(f"⚠️ Failed in {module.name}: {e}")


if __name__ == "__main__":
    main()
