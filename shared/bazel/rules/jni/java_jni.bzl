load("//shared/bazel/rules:java_rules.bzl", "wpilib_java_library")


def wpilib_java_jni_library(name, native_libs = [], **kwargs):
    wpilib_java_library(
        name = name,
        **kwargs,
    )