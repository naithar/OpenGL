import COpenGLOSX

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
