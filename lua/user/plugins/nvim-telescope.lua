local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension "media_files"
telescope.load_extension "projects"

telescope.setup {
  defaults = { file_ignore_patterns = { "node_modules" } },
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
    },
  },
}
