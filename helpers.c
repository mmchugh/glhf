#include "glew/include/GL/glew.h"
#include "glfw/include/GLFW/glfw3.h"

#include "helpers.h"

GLFWwindow* open_window(int width, int height, const char* title) {
    GLFWwindow* window;

    if (!glfwInit())
        return 0;

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    window = glfwCreateWindow(width, height, title, NULL, NULL);
    if(!window)
    {
        glfwTerminate();
        return 0;
    }
    glfwMakeContextCurrent(window);

    glfwSwapInterval(1);

    return window;
}

GLuint initialize_program(const char* vertex_source, const char* fragment_source) {
    glewInit();
    GLuint vertex_shader_id = glCreateShader(GL_VERTEX_SHADER);
    GLuint fragment_shader_id = glCreateShader(GL_FRAGMENT_SHADER);

    /*glShaderSource(vertex_shader_id, 1, &vertex_source , NULL);
    glCompileShader(vertex_shader_id);

    glShaderSource(fragment_shader_id, 1, &vertex_source , NULL);
    glCompileShader(fragment_shader_id);

    GLuint program_id = glCreateProgram();
    glAttachShader(program_id, vertex_shader_id);
    glAttachShader(program_id, fragment_shader_id);
    glLinkProgram(program_id);

    glDeleteShader(vertex_shader_id);
    glDeleteShader(fragment_shader_id);

    return program_id;
    */
    return 0;
}
