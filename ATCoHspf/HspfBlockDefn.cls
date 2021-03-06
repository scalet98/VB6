VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HspfBlockDef"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
'Copyright 2002 AQUA TERRA Consultants - Royalty-free use permitted under open source license

Dim pName As String
Dim pId As Long
Dim pSectionDefs As Collection 'of HspfSectionDef
Dim pTableDefs As Collection 'of HspfTableDef

Public Property Get Name() As String
  Name = pName
End Property
Public Property Let Name(newName As String)
  pName = newName
End Property

Public Property Get Id() As Long
  Id = pId
End Property
Public Property Let Id(newId As Long)
  pId = newId
End Property

Public Property Get SectionDefs() As Collection 'of HspfSectionDef
  Set SectionDefs = pSectionDefs
End Property
Public Property Set SectionDefs(newSectionDefs As Collection) 'of HspfSectionDef
  Set pSectionDefs = newSectionDefs
End Property

Public Property Get TableDefs() As Collection 'of HspfTableDef
  Set TableDefs = pTableDefs
End Property
Public Property Set TableDefs(newTableDefs As Collection) 'of HspfTableDef
  Set pTableDefs = newTableDefs
End Property

Public Function SectionID(inname$) As Long
  Dim i&
  SectionID = 0
  For i = 1 To pSectionDefs.Count
    If pSectionDefs(i).Name = inname Then
      If pName <> "RCHRES" Or (pName = "RCHRES" And i < 8) Then
        SectionID = i - 1
      Else
        SectionID = i - 2
      End If
    End If
  Next i
End Function
