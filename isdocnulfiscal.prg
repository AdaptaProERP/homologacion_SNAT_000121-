// Programa   : ISDOCNULFISCAL
// Fecha/Hora : 07/02/2025 05:20:39
// Propósito  : VALIDAR SI ES DOCUMENTO FISCAL, NO DEPENDER DEL PROGRAMADOR, CLASE TDOCENC
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

  IF oDoc:cTable=="DPDOCCLI"

    cText  :=IF(oDoc:ISDEF("DOC_TIPDOC"),oDoc:DOC_TIPDOC,"NO DOC_TIPDOC")
    cTipDoc:=IF(oDoc:ISDEF("DOC_TIPDOC"),oDoc:DOC_TIPDOC,cTipDoc)
    cTipTra:=IF(oDoc:ISDEF("DOC_TIPTRA"),oDoc:DOC_TIPTRA,cTipTra)
    cFecha :=IF(oDoc:ISDEF("DOC_FECHA" ),oDoc:DOC_FECHA ,dFecha )

    // No permite modificar la factura
    IF (cTipDoc="FAV" .OR. cTipDoc="TIK") .AND. dFecha>=CTOD("19/03/2025")
       lResp:=.F.
    ENDIF

    oDp:oFrameDp:SetText(cTable+" "+cTipDoc+" "+cTipTra)

  ENDIF

RETURN lResp
// EOF

