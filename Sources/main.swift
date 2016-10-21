import COpenGLOSX

//https://www.opengl.org/sdk/docs/man/
print("Hello, world!")

glDepthMask(GLboolean(GL_FALSE))
glClear(GLbitfield(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT))
glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_S), GLint(GL_MIRRORED_REPEAT))

struct Texture {

    func parameters(for target: gl.Target) -> Parameter {
        return Parameter(target: target)
    }
    
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
        
        case _1D
        case _2D
        case _3D
        case cubeMap
    }
    
    struct BufferMask: OptionSet {
        
        let rawValue: Int
        
        static let color = BufferMask(rawValue: 1 << 0)
        static let buffer = BufferMask(rawValue: 1 << 1)
        static let accum = BufferMask(rawValue: 1 << 2)
        static let stencil = BufferMask(rawValue: 1 << 3)
    }
    
    static var texture: Texture {
        return Texture()
    }
    
    static func begin(closure: (() -> Void)? = nil) {
        
    }
    
    static func end() {
        
    }
    
    static func color(_ red: Double = 1, _ green: Double = 1, _ blue: Double = 1, _ alpha: Double = 1) {
        
    }
    
    static func clear(mask: BufferMask) {
        
    }
    
}


gl.texture.parameters(for: ._1D).set(.nearest, for: .magFilter)

let value: [Texture.Parameter.Value] = gl.texture.parameters(for: ._1D).get(.magFilter)

gl.begin()
gl.end()

gl.begin {
    gl.clear(mask: [.color, .buffer])
    gl.color()
}
