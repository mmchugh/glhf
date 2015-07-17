from distutils.core import setup
from distutils.extension import Extension
import sys

from Cython.Build import cythonize

sourcefiles = [
    "glhf.pyx",
    "glew/src/glew.c",
    "glfw/src/context.c",
    "glfw/src/init.c",
    "glfw/src/input.c",
    "glfw/src/monitor.c",
    "glfw/src/window.c",
]

x11_sourcefiles = [
    "glfw/src/glx_context.c",
    "glfw/src/x11_init.c",
    "glfw/src/x11_monitor.c",
    "glfw/src/x11_window.c",
    "glfw/src/xkb_unicode.c",
    "glfw/src/linux_joystick.c",
    "glfw/src/posix_time.c",
    "glfw/src/posix_tls.c",
]

osx_sourcefiles = [
    "glfw/src/cocoa_init.m",
    "glfw/src/cocoa_monitor.m",
    "glfw/src/cocoa_window.m",
    "glfw/src/iokit_joystick.m",
    "glfw/src/mach_time.c",
    "glfw/src/posix_tls.c",
    "glfw/src/nsgl_context.m",
]


x11_defines = [
    ("_GLFW_USE_OPENGL", None),
    ("_GLFW_X11", None),
    ("_GLFW_GLX", None),
    ("_GLFW_HAS_GLXGETPROCADDRESS", None),
]

osx_defines = [
    ("_GLFW_USE_OPENGL", None),
    ("_GLFW_COCOA", None),
    ("_GLFW_NSGL", None),
    ("_GLFW_USE_CHDIR", None),
    ("_GLFW_USE_MENUBAR", None),
    ("_GLFW_USE_RETINA", None),
]

x11_libraries = [
    "GL",
    "X11",
    "Xrandr",
    "Xxf86vm",
    "Xi",
    "Xcursor",
    "m",
    "Xinerama",
]

osx_frameworks = [
    "Cocoa",
    "OpenGL",
    "IOKit",
    "CoreVideo",
]

includes = [
    "glew/include",
]

if sys.platform == 'linux2':
    sources = sourcefiles + x11_sourcefiles
    defines = x11_defines
    libraries = x11_libraries
    link_args = []
elif sys.platform == 'darwin':
    sources = sourcefiles + osx_sourcefiles
    defines = osx_defines
    libraries = []
    link_args = ['-framework ' + f for f in osx_frameworks]

extensions = [
    Extension(
        "glhf",
        sources=sources,
        include_dirs=includes,
        define_macros=defines,
        libraries=libraries,
        extra_link_args=link_args,
    )
]

setup(
    ext_modules=cythonize(extensions)
)
