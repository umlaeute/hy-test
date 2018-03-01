#!/usr/bin/env python3


import os
import hy
hy.importer.import_file_to_module(
    "__main__",
    os.path.join(os.path.dirname(os.path.realpath(__file__)), "hello.hy"))

