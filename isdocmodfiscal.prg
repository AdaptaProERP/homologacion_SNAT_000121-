// Programa   : ISDOCMODFISCAL
// Fecha/Hora : 07/02/2025 05:20:39
// Propósito  : VALIDAR SI ES DOCUMENTO FISCAL, NO DEPENDER DEL PROGRAMADOR, CLASE TDOCENC
//              la fecha del sistema debe ser superior a fecha 19/03/2025
//              No puede incluir facturas retrocediendo la fecha
// Creado Por : Juan Navas
// Llamado por: TDOCENC
// Aplicación :
// Tabla      :

#INCLUDE "DPXBASE.CH"

PROCE MAIN(oDoc)
  LOCAL lResp:=.T.
  LOCAL cTipDoc:=""
  LOCAL cTipTra:=""
  LOCAL dFecha :=CTOD("") // Fecha
  LOCAL cTable :=oDoc:cTable
  LOCAL dFchMax:=CTOD("19/03/2025") // Fecha Maxima

  IF oDoc:cTable=="DPDOCCLI"

    cText  :=IF(oDoc:ISDEF("DOC_TIPDOC"),oDoc:DOC_TIPDOC,"NO DOC_TIPDOC")
    cTipDoc:=IF(oDoc:ISDEF("DOC_TIPDOC"),oDoc:DOC_TIPDOC,cTipDoc)
    cTipTra:=IF(oDoc:ISDEF("DOC_TIPTRA"),oDoc:DOC_TIPTRA,cTipTra)
    cFecha :=IF(oDoc:ISDEF("DOC_FECHA" ),oDoc:DOC_FECHA ,dFecha )

    // No permite modificar la factura
    // Si el usuario actualiza ahorita, no podrá modificar facturas. Luego de la Homologación no podrá modificar ninguna factura ni nueva ni anterior
    IF cTipTra="D" .AND. (cTipDoc="FAV" .OR. cTipDoc="TIK") // .AND. oDp:dFecha>=dFchMax .AND. dFecha>=dFchMax
       // Campos que seran guardados para la auditoría
       oDoc:aFieldsC     :={"DOC_DCTO","DOC_OTROS","DOC_RECARG","DOC_BASNET","DOC_MTOEXE","DOC_NETO","DOC_MTOIVA","DOC_FECHA","DOC_HORA","DOC_CODIGO","DOC_TIPAFE","DOC_FACAFE","DOC_TIPDOC","DOC_NUMERO","DOC_SERFIS","DOC_CXC","DOC_DOCORG"}
       lResp:=.F.
    ENDIF

//     oDp:oFrameDp:SetText(cTable+" "+cTipDoc+" "+cTipTra)

  ENDIF

RETURN lResp
// EOF
