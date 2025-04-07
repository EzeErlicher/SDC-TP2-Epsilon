require 'ffi'

module NativeBinding

  SHARED_LIB_PATH = "#{File.dirname(__FILE__)}/libmidlayer.so".freeze

  extend FFI::Library
  ffi_lib SHARED_LIB_PATH

  attach_function :float_to_int, [:float], :int
end
