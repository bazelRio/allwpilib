load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Rules Python
http_archive(
    name = "rules_python",
    sha256 = "48a838a6e1983e4884b26812b2c748a35ad284fd339eb8e2a6f3adf95307fbcd",
    strip_prefix = "rules_python-0.16.2",
    url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.16.2.tar.gz",
)

# Download Extra java rules
RULES_JVM_EXTERNAL_TAG = "4.5"

RULES_JVM_EXTERNAL_SHA = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/refs/tags/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

# local_repository(
#     name = "bzlmodRio",
#     path = "../bzlmodRio/bzlmodRio",
# )
http_archive(
    name = "bzlmodRio",
    sha256 = "4d2fab5423f47df9bb7f2b697104f1cf1794823de9b8501e50aa14d4338bd3a4",
    strip_prefix = "bzlmodRio-6145f3f8e26590740cce628aba10348c1f64c3bd",
    url = "https://github.com/bzlmodRio/bzlmodRio/archive/6145f3f8e26590740cce628aba10348c1f64c3bd.tar.gz",
)

load("@bzlmodRio//private/non_bzlmod:download_dependencies.bzl", "download_dependencies")

download_dependencies(
    # allwpilib_version = "local",
    apriltaglib_version = "3.2.0-3",
    imgui_version = "1.89.1-1",
    libssh_version = "0.95-6",
    # navx_version = "local",
    ni_version = "2023.3.0",
    opencv_version = "4.6.0-4",  # TODO different than wpilib
    # phoenix_version = "local",
    # revlib_version = "local",
    rules_bazelrio_version = "0.0.9",
    rules_roborio_toolchain_version = "2023-7",
)

load("@bzlmodRio//private/non_bzlmod:setup_dependencies.bzl", "setup_dependencies")

setup_dependencies()

load("//shared/bazel/deps:repo.bzl", "load_third_party")

load_third_party()

# Initialize repositories for all packages in requirements_lock.txt.
load("@allwpilib_pip_deps//:requirements.bzl", "install_deps")

install_deps()

load("@maven//:defs.bzl", "pinned_maven_install")

pinned_maven_install()