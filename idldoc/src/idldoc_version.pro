function idldoc_version, full=full
  compile_opt strictarr
  
  version = '3.0-development'
  revision = '-r120'
  
  return, version + (keyword_set(full) ? (' ' + revision) : '')
end