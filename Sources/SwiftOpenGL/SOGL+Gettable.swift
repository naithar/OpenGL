//
//  SOGL+Gettable.swift
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
    
    //    https://www.opengl.org/sdk/docs/man/html/glGet.xhtml
    public static func get<T: Gettable, Result>(_ type: T.Type,
                           key: GLenum,
                           index: UInt? = nil,
                           closure: ([T.SwiftType]) throws -> Result) rethrows -> Result {
        var result = T.buffer
        if let index = index {
            T.getIndex(key, GLuint(index), &result)
        } else {
            T.get(key, &result)
        }
        return try closure(result.map { T.convert($0) })
    }
    
    public enum StringKey {
        
        case vendor
        case renderer
        case version
        case shadingLanguageVersion
        case extensions
        
        internal var raw: Int32 {
            switch self {
            case .vendor:
                return GL_VENDOR
            case .renderer:
                return GL_RENDERER
            case .version:
                return GL_VERSION
            case .shadingLanguageVersion:
                return GL_SHADING_LANGUAGE_VERSION
            case .extensions:
                return GL_EXTENSIONS
            }
        }
    }
    public static func string(for key: StringKey, index: UInt? = nil) -> String {
        if let index = index {
            guard let cString = glGetStringi(GLenum(key.raw), GLuint(index)) else { return "" }
            return String(cString: cString)
        } else if key != .extensions {
            guard let cString = glGetString(GLenum(key.raw)) else { return "" }
            return String(cString: cString)
        }
        
        return ""
    }
}
