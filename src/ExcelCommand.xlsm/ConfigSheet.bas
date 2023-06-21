Attribute VB_Name = "ConfigSheet"
'    Excel Commmand: An excel macro file to communicate some measurement insturuments.
'    Copyright (C) 2023 Takatoshi Yamaoka
'
'    This program is free software: you can redistribute it and/or modify
'    it under the terms of the GNU Affero General Public License as
'    published by the Free Software Foundation, either version 3 of the
'    License, or (at your option) any later version.
'
'    This program is distributed in the hope that it will be useful,
'    but WITHOUT ANY WARRANTY; without even the implied warranty of
'    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'    GNU Affero General Public License for more details.
'
'    You should have received a copy of the GNU Affero General Public License
'    along with this program.  If not, see <https://www.gnu.org/licenses/>.

Option Explicit

Const cfgSheet As String = "Config"

Type ExecOption
    timeout        As Long
    interval       As Long
End Type

Type ConnectLayout
    startRow       As Long
    endRow         As Long
    wireColumn     As Long
    addressColumn  As Long
    termColumn     As Long
    statusColumn   As Long
End Type

Type CommandLayout
    startRow       As Long
    endRow         As Long
    opColumn       As Long
    arg1Column     As Long
    arg2Column     As Long
    resultColumn   As Long
    statusColumn   As Long
End Type

Function GetExecOption() As ExecOption
    Dim sheet As Worksheet
    
    For Each sheet In Application.ThisWorkbook.Worksheets
        If sheet.name = cfgSheet Then
            Exit For
        End If
    Next sheet
    
    If sheet Is Nothing Then
        MsgBox "[" & cfgSheet & "]�V�[�g��������܂���", vbInformation
        Exit Function
    End If
    
    GetExecOption.timeout = CLng(sheet.Range("D5").value)
    GetExecOption.interval = CLng(sheet.Range("D6").value)
End Function

Function GetCnLayout() As ConnectLayout
    Dim sheet As Worksheet
    
    For Each sheet In Application.ThisWorkbook.Worksheets
        If sheet.name = cfgSheet Then
            Exit For
        End If
    Next sheet
    
    If sheet Is Nothing Then
        MsgBox "[" & cfgSheet & "]�V�[�g��������܂���", vbInformation
        Exit Function
    End If
    
    GetCnLayout.startRow = CLng(sheet.Range("D10").value)
    GetCnLayout.endRow = CLng(sheet.Range("D11").value)
    GetCnLayout.wireColumn = CLng(sheet.Range("D12").value)
    GetCnLayout.addressColumn = CLng(sheet.Range("D13").value)
    GetCnLayout.termColumn = CLng(sheet.Range("D14").value)
    GetCnLayout.statusColumn = CLng(sheet.Range("D15").value)
End Function

Function GetCmdLayout() As CommandLayout
    Dim sheet As Worksheet
    
    For Each sheet In Application.ThisWorkbook.Worksheets
        If sheet.name = cfgSheet Then
            Exit For
        End If
    Next sheet
    
    If sheet Is Nothing Then
        MsgBox "[" & cfgSheet & "]�V�[�g��������܂���", vbInformation
        Exit Function
    End If
    
    GetCmdLayout.startRow = CLng(sheet.Range("D19").value)
    GetCmdLayout.endRow = CLng(sheet.Range("D20").value)
    GetCmdLayout.opColumn = CLng(sheet.Range("D21").value)
    GetCmdLayout.arg1Column = CLng(sheet.Range("D22").value)
    GetCmdLayout.arg2Column = CLng(sheet.Range("D23").value)
    GetCmdLayout.resultColumn = CLng(sheet.Range("D24").value)
    GetCmdLayout.statusColumn = CLng(sheet.Range("D25").value)
End Function
