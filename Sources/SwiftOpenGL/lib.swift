#if os(Linux) || os(OSX)
    import COpenGLOSX
#endif

#if os(iOS)
    import OpenGLES
#endif


public enum gl {
    
    public struct Color {
        public var red: Double
        public var green: Double
        public var blue: Double
        public var alpha: Double
        
        public init(red: Double, green: Double, blue: Double, alpha: Double) {
            self.red = red
            self.green = green
            self.blue = blue
            self.alpha = alpha
        }
    }
    
    public struct BufferBitMask: OptionSet {
        
        public let rawValue: Int32
        
        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
        
        public static let buffer = BufferBitMask(rawValue: GL_COLOR_BUFFER_BIT)
        public static let stencil = BufferBitMask(rawValue: GL_STENCIL_BUFFER_BIT)
        public static let depth = BufferBitMask(rawValue: GL_DEPTH_BUFFER_BIT)
    }
    
    public static func viewport(x: Int, y: Int, width: Int, height: Int) {
        glViewport(GLint(x), GLint(y), GLsizei(width), GLsizei(height))
    }
    
    public static func clear(color: Color) {
        glClearColor(GLclampf(color.red), GLclampf(color.green), GLclampf(color.blue), GLclampf(color.alpha))
    }
    
    public static func clear(_ mask: BufferBitMask) {
        let mask = GLbitfield(mask.rawValue)
        glClear(mask)
    }
    
    public static func flush() {
        glFlush()
    }
    
    public enum MatrixMode {
        
        case modelView
        case projection
        case texture
        case color
        
        internal var raw: GLenum {
            switch self {
            case .modelView:
                return GLenum(GL_MODELVIEW)
            case .projection:
                return GLenum(GL_PROJECTION)
            case .texture:
                return GLenum(GL_TEXTURE)
            case .color:
                return GLenum(GL_COLOR)
            }
        }
    }
    
    public static func matrixMode(_ mode: MatrixMode) {
        glMatrixMode(mode.raw)
    }
    
    public static func loadIdentity() {
        glLoadIdentity()
    }
    
    public static func ortho(left: Double, right: Double, bottom: Double, top: Double, near: Double, far: Double) {
        #if os(iOS)
            glOrthof(Float(left), Float(right), Float(bottom), Float(top), Float(near), Float(far))
        #else
            glOrtho(left, right, bottom, top, near, far)
        #endif
    }
    
    public static func frustum(left: Double, right: Double, bottom: Double, top: Double, near: Double, far: Double) {
        #if os(iOS)
            glFrustumf(Float(left), Float(right), Float(bottom), Float(top), Float(near), Float(far))
        #else
            glFrustum(left, right, bottom, top, near, far)
        #endif
    }
    
    public static func perspective(angle: Double, aspect: Double, near: Double, far: Double) {
        let height = tan( angle / 360 * M_PI ) * near;
        let width = height * aspect;
        
        #if os(iOS)
            glFrustumf(Float(-width), Float(width), Float(-height), Float(height), Float(near), Float(far))
        #else
            glFrustum(-width, width, -height, height, near, far)
        #endif
    }
    
    public enum DrawMode {
        
        case triangles
        
        #if !os(iOS)
        case quads
        #endif
        
        internal var raw: GLenum {
            #if !os(iOS)
                switch self {
                case .triangles:
                    return GLenum(GL_TRIANGLES)
                case .quads:
                    return GLenum(GL_QUADS)
                }
            #else
                switch self {
                case .triangles:
                    return GLenum(GL_TRIANGLES)
                }
            #endif
        }
    }
    
    
    public static func begin(_ mode: DrawMode) {
        #if !os(iOS)
            glBegin(mode.raw)
        #endif
    }
    
    public static func end() {
        #if !os(iOS)
            glEnd()
        #endif
    }
    
    public static func begin(_ mode: DrawMode, draw: (Void) -> Void) {
        #if !os(iOS)
            self.begin(mode)
            draw()
            self.end()
        #endif
    }
    
}


//https://www.opengl.org/sdk/docs/man/
//print("Hello, world!")
/*
 glDepthMask(GLboolean(GL_FALSE))
 glClear(GLbitfield(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT))
 glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_S), GLint(GL_MIRRORED_REPEAT))
 
 struct Texture {
 
 func parameters(for target: gl.Target) -> Parameter {
 return Parameter(target: target)
 }
 
 func bind(_ texture: Int, to: gl.Target) {
 
 }
 
 func generate(count: Int) -> [Int] {
 return []
 }
 }
 
 extension Texture {
 
 struct Parameter {
 
 private var target: gl.Target
 
 enum Name {
 
 case minFilter
 case magFilter
 }
 
 enum Value {
 case nearest
 case linear
 }
 
 init(target: gl.Target) {
 self.target = target
 }
 
 func set(_ value: Value, for name: Name) {
 
 }
 
 func set(_ value: [Value], for name: Name) {
 
 }
 
 func set(_ value: [Double], for name: Name) {
 
 }
 
 func set(_ value: Double, for name: Name) {
 
 }
 
 func get(_ name: Name) -> [Value] {
 return []
 }
 
 func get(_ name: Name) -> [Double] {
 return []
 }
 }
 }
 
 struct gl {
 
 enum Target {
 
 case texture1D
 case texture2D
 case texture3D
 case textureCubeMap
 //        GL_COLOR_TABLE, GL_POST_CONVOLUTION_COLOR_TABLE, GL_POST_COLOR_MATRIX_COLOR_TABLE, GL_PROXY_COLOR_TABLE, GL_PROXY_POST_CONVOLUTION_COLOR_TABLE, or GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE.
 }
 
 
 
 static var texture: Texture {
 return Texture()
 }
 
 static func begin(closure: (() -> Void)? = nil) {
 
 }
 
 static func end() {
 
 }
 
 
 
 static func error() throws {
 
 }
 
 }
 
 
 gl.texture.parameters(for: .texture1D).set(.nearest, for: .magFilter)
 
 let value: [Texture.Parameter.Value] = gl.texture.parameters(for: .texture1D).get(.magFilter)
 
 gl.begin()
 gl.end()
 
 gl.begin {
 gl.clear(mask: [.color, .buffer])
 gl.color()
 }*/
