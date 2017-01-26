//
//  Gettable.swift
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

import Foundation

// TODO:
//CGFloat
//Int
//UInt

//https://www.khronos.org/opengl/wiki/Generic_Vertex_Attribute_-_examples
public protocol Gettable {
    
    associatedtype GLType
    associatedtype SwiftType
    
    static var buffer: [GLType] { get }
    static var get: (GLenum, UnsafeMutablePointer<GLType>) -> () { get }
    static var getIndex: (GLenum, GLuint, UnsafeMutablePointer<GLType>) -> () { get }
    
    static func convert(_ value: GLType) -> SwiftType
}

extension GLfloat: Gettable {
    
    public typealias GLType = GLfloat
    public typealias SwiftType = Float
    
    public static var buffer: [GLfloat] {
        return [GLfloat](repeating: 0, count: 4)
    }
    
    public static var get: (GLenum, UnsafeMutablePointer<GLfloat>) -> () {
        return glGetFloatv
    }
    
    public static var getIndex: (GLenum, GLuint, UnsafeMutablePointer<GLfloat>) -> () {
        return glGetFloati_v
    }
    
    public static func convert(_ value: GLfloat) -> Float {
        return value
    }
}

#if !os(iOS)
    extension GLdouble: Gettable {
        
        public typealias GLType = GLdouble
        public typealias SwiftType = Double
        
        public static var buffer: [GLdouble] {
            return [GLdouble](repeating: 0, count: 4)
        }
        
        public static var get: (GLenum, UnsafeMutablePointer<GLdouble>) -> () {
            return glGetDoublev
        }
        
        public static var getIndex: (GLenum, GLuint, UnsafeMutablePointer<GLdouble>) -> () {
            return glGetDoublei_v
        }
        
        public static func convert(_ value: GLdouble) -> Double {
            return value
        }
    }
#endif

extension GLboolean: Gettable {
    
    public typealias GLType = GLboolean
    public typealias SwiftType = Bool
    
    public static var buffer: [GLboolean] {
        return [GLboolean](repeating: 0, count: 4)
    }
    
    public static var get: (GLenum, UnsafeMutablePointer<GLboolean>) -> () {
        return glGetBooleanv
    }
    
    public static var getIndex: (GLenum, GLuint, UnsafeMutablePointer<GLboolean>) -> () {
        return glGetBooleani_v
    }
    
    public static func convert(_ value: GLboolean) -> Bool {
        return value != 0
    }
}
