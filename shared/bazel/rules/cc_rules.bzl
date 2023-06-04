load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_import", "cc_library", "cc_test")



def wpilib_cc_library(name, **kwargs):
    cc_library(name = name, **kwargs)


def wpilib_cc_shared_library(name, visibility = None, **kwargs):
    cc_library(name = name, **kwargs)
    native.alias(name = name + ".shared", actual = name, visibility=visibility)


def wpilib_cc_static_and_shared_library(name, standard_deps = [], wpi_maybe_shared_deps = [], visibility = None, export_symbols=None, **kwargs):
    deps = standard_deps + wpi_maybe_shared_deps
    cc_library(name = name, deps = deps, visibility=visibility, **kwargs)

    native.alias(name = name + ".static", actual = name, visibility=visibility)
    native.alias(name = name + ".shared", actual = name, visibility=visibility)

def wpilib_cc_binary(name, **kwargs):
    cc_library(name = name, **kwargs)

def wpilib_cc_test(name, **kwargs):
    cc_test(name = name, **kwargs)
