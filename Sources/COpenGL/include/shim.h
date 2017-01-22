#ifndef C_OpenGL_h
#define C_OpenGL_h

#ifdef __APPLE__

#define GLEW_STATIC
//#include "GL/glew.h"
//#include <epoxy/gl.h>
//#include <epoxy/gl_generated.h>

#include <OpenGL/gl.h>
#include "OpenGL/gl3.h"
#include "OpenGL/glu.h"

#else
#include <stdlib.h>
#include <GL/gl.h>
#endif

#endif
