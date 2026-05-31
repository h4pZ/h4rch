-- Environment variables -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- Exported because of nvidia. No wrapper needed with these.
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
