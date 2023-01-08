load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Rules Python
http_archive(
    name = "rules_python",
    sha256 = "5fa3c738d33acca3b97622a13a741129f67ef43f5fdfcec63b29374cc0574c29",
    strip_prefix = "rules_python-0.9.0",
    url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.9.0.tar.gz",
)

# Download BazelRio <3
http_archive(
    name = "bazelrio",
    sha256 = "4ddbac21a195a35e955cc4bc2a66bf7cee0d691dd84a4c00e45c771d1c72d2f1",
    strip_prefix = "bazelrio-e1519838743bab8eb1c16cfa4331c95848664ce2/bazelrio",
    url = "https://github.com/pjreiniger/bazelRio/archive/e1519838743bab8eb1c16cfa4331c95848664ce2.tar.gz",
)

# Download Extra java rules
RULES_JVM_EXTERNAL_TAG = "4.2"

RULES_JVM_EXTERNAL_SHA = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@bazelrio//:deps.bzl", "setup_bazelrio_dependencies")

setup_bazelrio_dependencies(
    apriltaglib_version = "3.2.0-3",
    imgui_version = "1.89.1-1",
    libssh_version = "0.95-6",
    navx_version = None,
    ni_version = None,
    opencv_version = "4.6.0-3",
    phoenix_version = None,
    revlib_version = None,
    toolchain_versions = "2023-7",
    wpilib_version = None,
)

load("//shared/bazel/deps:repo.bzl", "load_third_party")

load_third_party()

# Initialize repositories for all packages in requirements_lock.txt.
load("@__allwpilib_pip_deps//:requirements.bzl", "install_deps")

install_deps()

load("@maven//:defs.bzl", "pinned_maven_install")

pinned_maven_install()
