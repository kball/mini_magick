require "tempfile"

module MiniMagick
  class ImageTempFile < Tempfile
    def make_tmpname(ext, n)
      t = Time.now.to_f
      name = 'mini_magick%d-%d-%f%s' % [$$, n, t, ext ? ".#{ext}" : '']
      i = 0
      while File.exists?(name)
        i += 1
        name = 'mini_magick%d-%d-%f%d%s' % [$$, n, t, i, ext ? ".#{ext}" : '']
      end
      name
    end
  end
end
