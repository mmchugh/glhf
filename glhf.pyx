import atexit
import sys

cimport glew
cimport glfw

# Initialize glfw on import, because we can do that in python
glfw_init = glfw.glfwInit()
if not glfw_init:
    raise Exception("Couldn't initialize glfw")

# make sure we call terminate when we quit
atexit.register(glfw.glfwTerminate)

# Now initialize glew so it will get function pointers for all the fun stuff,
# unless we're on osx, because glewInit isn't necessary there (and segfaults
# if you try it)
if not sys.platform == 'darwin':
    glew_init = glew.glewInit()
    if not glew_init:
        raise Exception("Couldn't initialize glew")
    else:
        print "inited glew"

cdef extern from "helpers.h":
    cdef glfw.GLFWwindow* open_window(int width, int height, const char* title)
    cdef glew.GLuint initialize_program(const char* vertex_source, const char* fragment_source)

cdef class Window(object):
    cdef glfw.GLFWwindow* _window

    def __cinit__(self, width, height, title):
        self._window = open_window(width, height, title)

    def is_open(self):
        return not glfw.glfwWindowShouldClose(self._window)

    def finish_frame(self):
        glfw.glfwSwapBuffers(self._window)
        glfw.glfwPollEvents()

def clear():
    # need to find a better place to put this...
    cdef glew.GLbitfield GL_COLOR_BUFFER_BIT = 0x00004000
    glew.glClear(GL_COLOR_BUFFER_BIT)

vertex_shader = """#version 330 core
layout(location = 0)in vec4 position;

void main()
{
    gl_Position = position;
}
"""

fragment_shader = """#version 330

out vec4 final_color;

void main()
{
    final_color = vec4(1.0, 0.0, 0.0, 1.0);
}
"""

def default_program():
    return initialize_program(vertex_shader, fragment_shader)
