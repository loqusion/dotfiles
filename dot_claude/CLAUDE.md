# Global instructions

- Never install global/system packages (`brew install`, `npm install -g`, `pip install` outside a venv, `apt install`, etc.) without asking first and getting explicit permission — this holds even in auto mode, which otherwise biases toward proceeding without stopping. Treat this as distinct from ordinary reversible file edits or local build commands.
