//
//  SOGL+Program.swift
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
    
    public static func createProgram() -> GLuint {
        return glCreateProgram()
    }
    
    
    public static func attach(shader shaderID: GLuint, to programID: GLuint) {
        glAttachShader(programID, shaderID)
    }
    
    public static func linkProgram(id: GLuint) {
        glLinkProgram(id)
    }
    
    public static func isProgram(_ id: GLuint) -> Bool {
        return glIsProgram(id) != 0
    }
    
    
    
    //https://www.khronos.org/opengles/sdk/docs/man/xhtml/glGetProgramiv.xml
    
    public enum ProgramKey {
        
        case deleteStatus
        case linkStatus
        case validateStatus
        case infoLogLength
        case attachedShaders
        case activeAttributes
        case activeAttributeMaxLength
        case activeUniforms
        case activeUniformMaxLength
        
        internal var raw: Int32 {
            switch self {
            case .deleteStatus:
                return GL_DELETE_STATUS
            case .linkStatus:
                return GL_LINK_STATUS
            case .validateStatus:
                return GL_VALIDATE_STATUS
            case .infoLogLength:
                return GL_INFO_LOG_LENGTH
            case .attachedShaders:
                return GL_ATTACHED_SHADERS
            case .activeAttributes:
                return GL_ACTIVE_ATTRIBUTES
            case .activeAttributeMaxLength:
                return GL_ACTIVE_ATTRIBUTE_MAX_LENGTH
            case .activeUniforms:
                return GL_ACTIVE_UNIFORMS
            case .activeUniformMaxLength:
                return GL_ACTIVE_UNIFORM_MAX_LENGTH
            }
        }
    }
    
    public static func programInfo(id: GLuint, for key: ProgramKey) -> GLint {
        var value: GLint = 0
        glGetProgramiv(id, GLenum(key.raw), &value)
        return value
    }
    
    public static func programInfoLog(id: GLuint, length: GLint) -> String? {
        var log: [Int8] = []
        glGetProgramInfoLog(id, length, nil, &log)
        return String(validatingUTF8: log)
    }
    
    public static func delete(program id: GLuint) {
        glDeleteProgram(id)
    }
}
