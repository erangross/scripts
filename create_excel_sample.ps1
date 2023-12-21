# Define some data
$data = @(
    [PSCustomObject]@{Name=[char]0x05D9 + [char]0x05D5 + [char]0x05D7 + [char]0x05E0 + [char]0x05DF; Age=30; Occupation=[char]0x05DE + [char]0x05D4 + [char]0x05E0 + [char]0x05D3 + [char]0x05E1},
    [PSCustomObject]@{Name=[char]0x05D9 + [char]0x05D5 + [char]0x05E0 + [char]0x05D4; Age=28; Occupation=[char]0x05E8 + [char]0x05D5 + [char]0x05E4 + [char]0x05D0 + [char]0x05D4}
)

# Write the data to an Excel file, freeze the first row
$excel = $data | Export-Excel -Path "C:\Users\EranGross\Documents\file.xlsx" -Title "My Data" -BoldTopRow -AutoSize -WorksheetName "Sheet1" -FreezeTopRow -PassThru

# Set the direction of the text to right-to-left
$excel.Workbook.Worksheets["Sheet1"].View.RightToLeft = $true

# Set the font size for the title
$excel.Workbook.Worksheets["Sheet1"].Cells["1:1"].Style.Font.Size = 24

# Save and close the Excel file
Close-ExcelPackage $excel