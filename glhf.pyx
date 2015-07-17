import atexit

cimport glew
cimport glfw

# Initialize glfw on import, because we can do that in python
glfw_init = glfw.glfwInit()
if not glfw_init:
    raise Exception("Couldn't initialize glfw")

# make sure we call terminate when we quit
atexit.register(glfw.glfwTerminate)

# Now initialize glew so it will get function pointers for all the fun stuff
glew_init = glew.glewInit()
if not glew_init:
    raise Exception("Couldn't initialize glew")

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
