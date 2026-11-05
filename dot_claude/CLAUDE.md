# Global instructions

- Never install global/system packages (`brew install`, `npm install -g`, `pip install` outside a venv, `apt install`, etc.) without asking first and getting explicit permission — this holds even in auto mode, which otherwise biases toward proceeding without stopping. Treat this as distinct from ordinary reversible file edits or local build commands.
- I edit files by hand between prompts. Never assume a file still matches what you last wrote or read. Re-read its current contents immediately before overwriting, editing, or executing it. Prefer targeted edits over whole-file rewrites. To test a script, run the logic in a scratch copy, not the real script, unless I ask you to run it.
- Default for interactive `rsync`: `rsync -ah --progress --stats`. It works on every rsync, including macOS openrsync. Use `--info=progress2` only when rsync 3.1+ is confirmed and the transfer has many files.
- Any `rsync` command you write or run that uses `-v`, `--stats`, `--progress`, or `--info=progress2` must include `-h` (e.g. `rsync -avh`). The only exception is output a script will parse: use `--no-h` there and say why.
