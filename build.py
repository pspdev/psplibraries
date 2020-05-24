#!/usr/bin/env python3
import os
import sys


def get_dependencies(pspbuild):
    if not os.path.isfile:
        raise FileNotFoundError(
            "The file {} either doesn't exist or is a directory".format(pspbuild)
        )
    dependencies = []

    with open(pspbuild, "r") as read_pspbuild:
        lines = read_pspbuild.readlines()
        for line in lines:
            if line.startswith("depends=") or line.startswith("makedepends="):
                print(line)
                dependencies.append(line.split("'")[1])

    return dependencies

print(get_dependencies(sys.argv[1]))
