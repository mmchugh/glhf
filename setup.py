from distutils.core import setup
from Cython.Build import cythonize
from distutils.extension import Extension

sourcefiles = [
    "glhf.pyx",
    "glew/src/glew.c",
    "glfw/src/glx_context.c",
    "glfw/src/x11_init.c",
    "glfw/src/x11_monitor.c",
    "glfw/src/x11_window.c",
    "glfw/src/xkb_unicode.c",
    "glfw/src/linux_joystick.c",
    "glfw/src/posix_time.c",
    "glfw/src/posix_tls.c",
    "glfw/src/context.c",
    "glfw/src/init.c",
    "glfw/src/input.c",
    "glfw/src/monitor.c",
    "glfw/src/window.c",
]

includes = [
    "glew/include",
]

extensions = [
    Extension(
        "glhf",
        sources=sourcefiles,
        include_dirs=includes,
        define_macros=[
            ("_GLFW_USE_OPENGL", None),
            ("_GLFW_X11", None),
            ("_GLFW_GLX", None),
            ("_GLFW_HAS_GLXGETPROCADDRESS", None),
        ],
        libraries=[
            "GL",
            "X11",
            "Xrandr",
            "Xxf86vm",
            "Xi",
            "Xcursor",
            "m",
            "Xinerama",
        ],
    )
]

setup(
    ext_modules=cythonize(extensions)
)
