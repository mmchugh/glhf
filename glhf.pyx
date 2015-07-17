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

# need to find a better place to put this...
GL_COLOR_BUFFER_BIT = 0x00004000

def open_window(width, height, title):
    global _window
    _window = glfw.glfwCreateWindow(width, height, title, NULL, NULL)

    #set this window as the opengl context
    glfw.glfwMakeContextCurrent(_window)

    #enable vsync
    glfw.glfwSwapInterval(1)

    # do a first clear
    glew.glClearColor(0.0, 0.0, 0.0, 1.0)
    print GL_COLOR_BUFFER_BIT
    glew.glClear(GL_COLOR_BUFFER_BIT)

    # and go through the first round
    finish_frame()

def finish_frame():
    glfw.glfwSwapBuffers(_window)
    glfw.glfwPollEvents()
