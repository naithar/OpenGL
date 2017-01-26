//
//  SOGL+Shader.swift
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
    
    public static func isShader(_ id: GLuint) -> Bool {
        return glIsShader(id) != 0
    }
    
    public enum ShaderType {
        
        //        case compute //opengl 4.3
        case vertex
        case tessControl
        case tessEvaluation
        case fragment
        case geometry
        
        internal var raw: Int32 {
            switch self {
                //            case .compute:
            //                return GL_COMPUTE_SHADER
            case .vertex:
                return GL_VERTEX_SHADER
            case .tessControl:
                return GL_TESS_CONTROL_SHADER
            case .tessEvaluation:
                return GL_TESS_EVALUATION_SHADER
            case .fragment:
                return GL_FRAGMENT_SHADER
            case .geometry:
                return GL_GEOMETRY_SHADER
            }
        }
    }
    
    public static func createShader(_ key: ShaderType) -> GLuint {
        return glCreateShader(GLenum(key.raw))
    }
    
    public static func shaderSource(id: GLuint, sources: [String]) {
        
        var array = [UnsafePointer<GLchar>?]()
        
        for shader in sources {
            shader.withCString { string in
                array.append(string)
            }
        }
        
        glShaderSource(id, GLsizei(array.count), array, nil)
    }
    
    public static func delete(shader id: GLuint) {
        glDeleteShader(id)
    }
    
    public static func compileShader(id: GLuint) {
        glCompileShader(id)
    }
    
    public enum ShaderKey {
        
        case type
        case deleteStatus
        case compileStatus
        case infoLogLength
        case shaderSourceLength
        
        internal var raw: Int32 {
            switch self {
            case .type:
                return GL_SHADER_TYPE
            case .deleteStatus:
                return GL_DELETE_STATUS
            case .compileStatus:
                return GL_COMPILE_STATUS
            case .infoLogLength:
                return GL_INFO_LOG_LENGTH
            case .shaderSourceLength:
                return GL_SHADER_SOURCE_LENGTH
            }
        }
    }
    
    public static func shaderInfo(id: GLuint, for key: ShaderKey) -> GLint {
        var value: GLint = 0
        glGetShaderiv(id, GLenum(key.raw), &value)
        return value
    }
    
    public static func shaderInfoLog(id: GLuint, length: GLint) -> String? {
        var log: [Int8] = []
        glGetShaderInfoLog(id, length, nil, &log)
        return String.init(validatingUTF8: log)
    }
}
