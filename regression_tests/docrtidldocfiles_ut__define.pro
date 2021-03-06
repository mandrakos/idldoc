; docformat = 'rst'

;+
; Basic IDLdoc run of on save files.
;-
function docrtidldocfiles_ut::test_basic
  compile_opt strictarr

  idldoc, root=filepath('idldocfiles', root=self.root), $
          output=filepath('idldocfiles-docs', root=self.root), $
          title='Testing idldoc files', $
          subtitle='Basic test', $
          /silent, n_warnings=nWarnings, error=error, $
          log_file=filepath('idldoc.log', subdir='idldocfiles-docs', root=self.root)
          
  assert, error eq 0, 'failed with error ' + !error_state.msg

  if (self.showResults) then begin
    filename = filepath('index.html', subdir='idldocfiles-docs', root=self.root)
    mg_open_url, 'file://' + filename
  endif
    
  assert, nWarnings eq 0, 'failed with warnings'
  
  return, 1
end


;+
; Define instance variables.
;-
pro docrtidldocfiles_ut__define
  compile_opt strictarr
  
  define = { DOCrtIDLdocFiles_ut, inherits DOCrtTestCase }
end