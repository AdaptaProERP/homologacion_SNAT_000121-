// Programa   : ISDOCINCFISCAL
// Fecha/Hora : 07/02/2025 07:21:51
// Propósito  : Validar la nueva Factura sea cronologicamente Superior a la Ultima 
// Creado Por : Juan Navas
// Llamado por: TDOCENC
// Aplicación :
// Tabla      :

#INCLUDE "DPXBASE.CH"

PROCE MAIN(oDoc)
  LOCAL lResp  :=.T.
  LOCAL cTipDoc:=""
  LOCAL cTipTra:=""
  LOCAL dFecha :=CTOD("") // Fecha
  LOCAL cTable :=oDoc:cTable
  LOCAL cSerie :=""

  IF oDoc:cTable=="DPDOCCLI"

    cTipDoc:=IF(oDoc:ISDEF("DOC_TIPDOC"),oDoc:DOC_TIPDOC,cTipDoc)
    cTipTra:=IF(oDoc:ISDEF("DOC_TIPTRA"),oDoc:DOC_TIPTRA,cTipTra)
    cFecha :=IF(oDoc:ISDEF("DOC_FECHA" ),oDoc:DOC_FECHA ,dFecha )
    cSerie :=IF(oDoc:ISDEF("DOC_SERFIS"),oDoc:DOC_SERFIS,cSerie )

    // No permite Incluir con fechas Anteriores
    IF cTipTra="D" .AND. (cTipDoc="FAV" .OR. cTipDoc="TIK" .OR. cTipDoc="DEB" .OR. cTipDoc="CRE") 
       // Aqui asignamos el Correlativo
? "aqui val el correlativo propio del sistema"
       lResp:=.F.
    ENDIF

  ENDIF

RETURN lResp
// EOF
