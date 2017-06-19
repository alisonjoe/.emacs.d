(setq dynamic-library-alist
      '((xpm "libxpm.dll" "xpm4.dll" "libXpm-nox4.dll")
        (png "libpng12d.dll" "libpng12.dll" "libpng.dll"
             "libpng13d.dll" "libpng13.dll")
        (jpeg "jpeg62.dll" "libjpeg.dll" "jpeg-62.dll"
              "jpeg.dll")
        (libxml2 "libxml2.dll" "libxml2-2.dll")
        (tiff "libtiff3.dll" "libtiff.dll")
        (gif "giflib4.dll" "libungif4.dll" "libungif.dll")
        (svg "librsvg-2-2.dll")
        (gdk-pixbuf "libgdk_pixbuf-2.0-0.dll")
        (glib "libglib-2.0-0.dll")
        (gobject "libgobject-2.0-0.dll")))

(provide 'init-dynamic)
