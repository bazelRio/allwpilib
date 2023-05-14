load("@rules_bazelrio//:java_rules.bzl", "bazelrio_java_binary", "bazelrio_java_test")
load("@rules_java//java:defs.bzl", "java_library")

def wpilib_java_library(
        name,
        tags = [],
        **kwargs):
    java_library(
        name = name,
        tags = tags + ["allwpilib-build-java"],
        **kwargs
    )

def wpilib_java_binary(name, deps = [], runtime_deps = [], data = [], tags = [], **kwargs):
    bazelrio_java_binary(
        name = name,
        deps = deps,
        runtime_deps = runtime_deps,
        data = data,
        tags = tags + ["allwpilib-build-java"],
        **kwargs
    )

def wpilib_java_junit5_test(
        name,
        deps = [],
        data = [],
        runtime_deps = [],
        args = [],
        tags = [],
        package = "edu",
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

    bazelrio_java_test(
        name = name,
        deps = deps + junit_deps,
        runtime_deps = runtime_deps + junit_runtime_deps,
        args = args + ["--select-package", package],
        main_class = "org.junit.platform.console.ConsoleLauncher",
        tags = tags + ["allwpilib-build-java", "no-sandbox", "no-asan", "no-tsan", "no-ubsan"],
        env = {
            "LD_LIBRARY_PATH": ".",
            "PATH": ".",
        },  # TODO fishy
        jvm_flags = [
            "-Djava.library.path=.",
        ],
        use_testrunner = False,
        **kwargs
    )
