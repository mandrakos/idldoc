; docformat = 'rst'

;+
; Format parsers parse a comment block using a particular format for comments:
; the standard IDL template, IDLdoc style @-tags, or rst style syntax. The 
; format parser will call the markup parser to parse free text comments in the
; comment block.
;-


;+
; Handles parsing of a code block. 
;
; :Abstract:
; :Params:
;    `lines` : in, required, type=strarr
;       all lines of the comment block
; :Keywords:
;    `routine` : in, required, type=object
;       routine tree object 
;    `markup_parser` : in, required, type=object
;       markup parser object
;-
pro docparformatparser::parseRoutineComments, lines, routine=routine, $
                                               markup_parser=markupParser
  compile_opt strictarr
  
end


pro docparformatparser::parseFileComments, lines, file=file, $
                                           markup_parser=markupParser
  compile_opt strictarr
  
end


pro docparformatparser::parseIDLdocComments, lines, file=file, $
                                             markup_parser=markupParser
  compile_opt strictarr

  comments = markupParser->parse(lines)
  file->setProperty, comments=comments  
end


pro docparformatparser::parseOverviewComments, lines, system=system, $
                                               markup_parser=markupParser
  compile_opt strictarr
  
end


function docparformatparser::init, system=system
  compile_opt strictarr
  
  self.system = system
  
  return, 1
end


;+
; Define instance variables.
;-
pro docparformatparser__define 
  compile_opt strictarr
  
  define = { DOCparFormatParser, system: obj_new() }
end