# https://github.com/pypa/pip/issues/8090#issuecomment-803363268
set -gx PYTHON_KEYRING_BACKEND keyring.backends.null.Keyring
