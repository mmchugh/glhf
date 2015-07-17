import atexit

cimport glfw

# Initialize glfw on import, because we can do that in python
init = glfw.glfwInit()
if not init:
    raise Exception("Couldn't initialize glfw")

# make sure we call terminate when we quit
atexit.register(glfw.glfwTerminate)

cdef glfw.GLFWwindow* _window = NULL

def open_window(width, height, title):
    global _window
    _window = glfw.glfwCreateWindow(width, height, title, NULL, NULL)

    #set this window as the opengl context
    glfw.glfwMakeContextCurrent(_window)

    #enable vsync
    glfw.glfwSwapInterval(1)

def finish_frame():
    glfw.glfwSwapBuffers(_window)
    glfw.glfwPollEvents()
