//
//  SOGL+Error.swift
//  App
//
//  Created by Sergey Minakov on 26.01.17.
//
//

#if os(OSX)
    import COpenGLOSX
#elseif os(Linux)
    import COpenGLLinux
#elseif os(iOS)
    import OpenGLES
#endif

extension gl {
    
    //glGetError() // https://www.khronos.org/opengl/wiki/GLAPI/glGetError
    
    public static func getError() -> GLenum {
        return glGetError()
    }
}
