Attribute VB_Name = "ConfigSheet"
Option Explicit

Const cfgSheet As String = "97_config"

Type ExecOption
    timeout        As Long
    interval       As Long
    repeat         As Long
    displayTime    As Boolean
    displayBin     As Boolean
    saveBin        As Boolean
End Type

Type ConnectLayout
    startRow       As Long
    endRow         As Long
    wireColumn     As Long
    addressColumn  As Long
    timeoutColumn  As Long
    statusColumn   As Long
End Type

Type CommandLayout
    startRow       As Long
    endRow         As Long
    deviceColumn   As Long
    commandColumn  As Long
    responseColumn As Long
    statusColumn   As Long
End Type

Function GetExecOption As ExecOption
    Dim sheet As Worksheet
    
    For Each sheet In Application.ThisWorkbook.Worksheets
        If sheet.name = cfgSheet Then
            Exit For
        End If
    Next sheet
    
    If sheet Is Nothing Then
        MsgBox "[config]�V�[�g�͂���܂���", vbInformation
        Exit Function
    End If
    
    GetExecOption.timeout     = CLng (sheet.Range("D5").Value)
    GetExecOption.interval    = CLng (sheet.Range("D6").Value)
    GetExecOption.repeat      = CLng (sheet.Range("D7").Value)
    GetExecOption.displayTime = CBool(sheet.Range("D8").Value)
    GetExecOption.displayBin  = CBool(sheet.Range("D9").Value)
    GetExecOption.saveBin     = CBool(sheet.Range("D10").Value)
End Function

Function GetCnLayout As ConnectLayout
    Dim sheet As Worksheet
    
    For Each sheet In Application.ThisWorkbook.Worksheets
        If sheet.name = cfgSheet Then
            Exit For
        End If
    Next sheet
    
    If sheet Is Nothing Then
        MsgBox "[config]�V�[�g�͂���܂���", vbInformation
        Exit Function
    End If
    
    GetCnLayout.startRow      = CLng(sheet.Range("D14").Value)
    GetCnLayout.endRow     �@ = CLng(sheet.Range("D15").Value)
    GetCnLayout.wireColumn    = CLng(sheet.Range("D16").Value)
    GetCnLayout.addressColumn = CLng(sheet.Range("D17").Value)
    GetCnLayout.timeoutColumn = CLng(sheet.Range("D18").Value)
    GetCnLayout.statusColumn  = CLng(sheet.Range("D19").Value)
End Function

Function GetCmdLayout As CommandLayout
    Dim sheet As Worksheet
    
    For Each sheet In Application.ThisWorkbook.Worksheets
        If sheet.name = cfgSheet Then
            Exit For
        End If
    Next sheet
    
    If sheet Is Nothing Then
        MsgBox "[config]�V�[�g�͂���܂���", vbInformation
        Exit Function
    End If
    
    GetCmdLayout.startRow       = CLng(sheet.Range("D23").Value)
    GetCmdLayout.endRow         = CLng(sheet.Range("D24").Value)
    GetCmdLayout.deviceColumn   = CLng(sheet.Range("D25").Value)
    GetCmdLayout.commandColumn  = CLng(sheet.Range("D26").Value)
    GetCmdLayout.responseColumn = CLng(sheet.Range("D27").Value)
    GetCmdLayout.statusColumn   = CLng(sheet.Range("D28").Value)
End Function
