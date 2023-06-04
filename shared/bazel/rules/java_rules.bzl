load("@rules_java//java:defs.bzl", "java_binary", "java_library", "java_test")

def wpilib_java_library(name, **kwargs):
    java_library(
        name = name,
        **kwargs
    )


def wpilib_java_binary(name, **kwargs):
    java_binary(
        name = name,
        **kwargs
    )

def wpilib_java_junit5_test(
    name, 
    deps = [],
    data = [],
    runtime_deps = [],
    args = [],
    tags = [],
    size=None,
    **kwargs):
    
    junit_deps = [
        "@maven//:org_junit_jupiter_junit_jupiter_api",
        "@maven//:org_junit_jupiter_junit_jupiter_params",
        "@maven//:org_junit_jupiter_junit_jupiter_engine",
    ]

    junit_runtime_deps = [
        "@maven//:org_junit_platform_junit_platform_commons",
        "@maven//:org_junit_platform_junit_platform_console",
        "@maven//:org_junit_platform_junit_platform_engine",
        "@maven//:org_junit_platform_junit_platform_launcher",
        "@maven//:org_junit_platform_junit_platform_suite_api",
    ]

    java_binary(
        name = name,
        deps = deps + junit_deps,
        runtime_deps = runtime_deps + junit_runtime_deps,
        testonly=True,
        **kwargs
    )
    