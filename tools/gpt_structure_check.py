import os
import subprocess
import sys

import openai

openai.api_key = os.getenv("OPENAI_API_KEY")


def get_staged_files():
    result = subprocess.run(
        ["git", "diff", "--cached", "--name-only"], capture_output=True, text=True
    )
    return result.stdout.strip().split("\n")


def ask_chatgpt(file_list):
    system_msg = "You are a code reviewer. Evaluate if the developer's file structure and naming follow good practices."
    user_msg = f"Staged files for commit:\n{file_list}"

    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": system_msg},
            {"role": "user", "content": user_msg},
        ],
    )
    return response.choices[0].message.content.strip()


if __name__ == "__main__":
    files = get_staged_files()
    if not files or files == [""]:
        sys.exit(0)

    feedback = ask_chatgpt("\n".join(files))
    print("\n🧠 GPT Feedback:\n", feedback)

    if (
        "suggest" in feedback.lower()
        or "rename" in feedback.lower()
        or "restructure" in feedback.lower()
    ):
        print("\n❌ GPT flagged structure issues.")
        sys.exit(1)
    else:
        print("✅ GPT approved.")
        sys.exit(0)
